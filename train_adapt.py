#!/usr/bin/env python
# coding: utf-8
'''Subject-adaptative classification with KU Data,
using Deep ConvNet model from [1].

References
----------
.. [1] Schirrmeister, R. T., Springenberg, J. T., Fiederer, L. D. J.,
   Glasstetter, M., Eggensperger, K., Tangermann, M., Hutter, F. & Ball, T. (2017).
   Deep learning with convolutional neural networks for EEG decoding and
   visualization.
   Human Brain Mapping , Aug. 2017. Online: http://dx.doi.org/10.1002/hbm.23730
'''
import argparse
import json
import logging
import sys
from os.path import join as pjoin

import h5py
import torch
import torch.nn.functional as F
from braindecode.models.deep4 import Deep4Net
from braindecode.torch_ext.optimizers import AdamW
from braindecode.torch_ext.util import set_random_seeds
from torch import nn

logging.basicConfig(format='%(asctime)s %(levelname)s : %(message)s',
                    level=logging.INFO, stream=sys.stdout)

parser = argparse.ArgumentParser(
    description='Subject-adaptative classification with KU Data')
parser.add_argument('datapath', type=str, help='Path to the h5 data file')
parser.add_argument('modelpath', type=str,
                    help='Path to the base model folder')
parser.add_argument('outpath', type=str, help='Path to the result folder')
parser.add_argument('-scheme', type=int, help='Adaptation scheme', default=4)
parser.add_argument(
    '-trfrate', type=int, help='The percentage of data for adaptation', default=100)
parser.add_argument('-lr', type=float, help='Learning rate', default=0.0005)
parser.add_argument('-gpu', type=int, help='The gpu device to use', default=0)

args = parser.parse_args()
datapath = args.datapath
outpath = args.outpath
modelpath = args.modelpath
scheme = args.scheme
rate = args.trfrate
lr = args.lr
dfile = h5py.File(datapath, 'r')
torch.cuda.set_device(args.gpu)
set_random_seeds(seed=20200205, cuda=True)
BATCH_SIZE = 16
TRAIN_EPOCH = 200

# Randomly shuffled subject.
subjs = [35, 47, 46, 37, 13, 27, 12, 32, 53, 54, 4, 40, 19, 41, 18, 42, 34, 7,
         49, 9, 5, 48, 29, 15, 21, 17, 31, 45, 1, 38, 51, 8, 11, 16, 28, 44, 24,
         52, 3, 26, 39, 50, 6, 23, 2, 14, 25, 20, 10, 33, 22, 43, 36, 30]


# Get data from single subject.
def get_data(subj):
    dpath = '/s' + str(subj)
    X = dfile[pjoin(dpath, 'X')]
    Y = dfile[pjoin(dpath, 'Y')]
    return X[:], Y[:]


X, Y = get_data(subjs[0])
n_classes = 2
in_chans = X.shape[1]
# final_conv_length = auto ensures we only get a single output in the time dimension
model = Deep4Net(in_chans=in_chans, n_classes=n_classes,
                 input_time_length=X.shape[2],
                 final_conv_length='auto').cuda()

# Deprecated.


def reset_conv_pool_block(network, block_nr):
    suffix = "_{:d}".format(block_nr)
    conv = getattr(network, 'conv' + suffix)
    kernel_size = conv.kernel_size
    n_filters_before = conv.in_channels
    n_filters = conv.out_channels
    setattr(network, 'conv' + suffix,
            nn.Conv2d(
                n_filters_before,
                n_filters,
                kernel_size,
                stride=(1, 1),
                bias=False,
            ))
    setattr(network, 'bnorm' + suffix,
            nn.BatchNorm2d(
                n_filters,
                momentum=0.1,
                affine=True,
                eps=1e-5,
            ))
    # Initialize the layers.
    conv = getattr(network, 'conv' + suffix)
    bnorm = getattr(network, 'bnorm' + suffix)
    nn.init.xavier_uniform_(conv.weight, gain=1)
    nn.init.constant_(bnorm.weight, 1)
    nn.init.constant_(bnorm.bias, 0)


def reset_model(checkpoint):
    # Load the state dict of the model.
    model.network.load_state_dict(checkpoint['model_state_dict'])

    # # Resets the last conv block
    # reset_conv_pool_block(model.network, block_nr=4)
    # reset_conv_pool_block(model.network, block_nr=3)
    # reset_conv_pool_block(model.network, block_nr=2)
    # # Resets the fully-connected layer.
    # # Parameters of newly constructed modules have requires_grad=True by default.
    # n_final_conv_length = model.network.conv_classifier.kernel_size[0]
    # n_prev_filter = model.network.conv_classifier.in_channels
    # n_classes = model.network.conv_classifier.out_channels
    # model.network.conv_classifier = nn.Conv2d(
    #     n_prev_filter, n_classes, (n_final_conv_length, 1), bias=True)
    # nn.init.xavier_uniform_(model.network.conv_classifier.weight, gain=1)
    # nn.init.constant_(model.network.conv_classifier.bias, 0)

    if scheme != 5:
        # Freeze all layers.
        for param in model.network.parameters():
            param.requires_grad = False

        if scheme in {1, 2, 3, 4}:
            # Unfreeze the FC layer.
            for param in model.network.conv_classifier.parameters():
                param.requires_grad = True

        if scheme in {2, 3, 4}:
            # Unfreeze the conv4 layer.
            for param in model.network.conv_4.parameters():
                param.requires_grad = True
            for param in model.network.bnorm_4.parameters():
                param.requires_grad = True

        if scheme in {3, 4}:
            # Unfreeze the conv3 layer.
            for param in model.network.conv_3.parameters():
                param.requires_grad = True
            for param in model.network.bnorm_3.parameters():
                param.requires_grad = True

        if scheme == 4:
            # Unfreeze the conv2 layer.
            for param in model.network.conv_2.parameters():
                param.requires_grad = True
            for param in model.network.bnorm_2.parameters():
                param.requires_grad = True

    # Only optimize parameters that requires gradient.
    optimizer = AdamW(filter(lambda p: p.requires_grad, model.network.parameters()),
                      lr=lr, weight_decay=0.5*0.001)
    model.compile(loss=F.nll_loss, optimizer=optimizer,
                  iterator_seed=20200205, )

cutoff = int(rate * 200 / 100)
# Use only session 1 data for training
assert(cutoff <= 200)

for fold, subj in enumerate(subjs):
    suffix = '_s' + str(subj) + '_f' + str(fold)
    checkpoint = torch.load(pjoin(modelpath, 'model_f' + str(fold) + '.pt'),
                            map_location='cuda:' + str(args.gpu))
    reset_model(checkpoint)

    X, Y = get_data(subj)
    X_train, Y_train = X[:cutoff], Y[:cutoff]
    X_val, Y_val = X[200:300], Y[200:300]
    X_test, Y_test = X[300:], Y[300:]
    model.fit(X_train, Y_train, epochs=TRAIN_EPOCH,
              batch_size=BATCH_SIZE, scheduler='cosine',
              validation_data=(X_val, Y_val), remember_best_column='valid_loss')
    model.epochs_df.to_csv(pjoin(outpath, 'epochs' + suffix + '.csv'))
    test_loss = model.evaluate(X_test, Y_test)
    with open(pjoin(outpath, 'test' + suffix + '.json'), 'w') as f:
        json.dump(test_loss, f)

dfile.close()
