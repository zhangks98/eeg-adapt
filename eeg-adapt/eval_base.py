#!/usr/bin/env python
# coding: utf-8
'''Subject-independent model evaluator.
'''
import argparse
import json
import logging
import sys
from os.path import join as pjoin

import h5py
import numpy as np
import torch
import torch.nn.functional as F
from braindecode.models.deep4 import Deep4Net
from braindecode.torch_ext.optimizers import AdamW
from braindecode.torch_ext.util import set_random_seeds

logging.basicConfig(format='%(asctime)s %(levelname)s : %(message)s',
                    level=logging.INFO, stream=sys.stdout)

parser = argparse.ArgumentParser(
    description='Subject independent model evaluator.')
parser.add_argument('datapath', type=str, help='Path to KU data')
parser.add_argument('modelpath', type=str, help='Path to base model')
parser.add_argument('outpath', type=str, help='Path to output')
parser.add_argument('-gpu', type=int, help='The gpu device to use', default=0)

args = parser.parse_args()
datapath = args.datapath
outpath = args.outpath
modelpath = args.modelpath
dfile = h5py.File(datapath, 'r')
torch.cuda.set_device(args.gpu)
set_random_seeds(seed=20200205, cuda=True)
BATCH_SIZE = 16

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

# Dummy train data to set up the model.
X_train = np.zeros(X[:2].shape).astype(np.float32)
Y_train = np.zeros(Y[:2].shape).astype(np.int64)


def reset_model(checkpoint):
    # Load the state dict of the model.
    model.network.load_state_dict(checkpoint['model_state_dict'])

    # Only optimize parameters that requires gradient.
    optimizer = AdamW(filter(lambda p: p.requires_grad, model.network.parameters()),
                      lr=1*0.01, weight_decay=0.5*0.001)
    model.compile(loss=F.nll_loss, optimizer=optimizer,
                  iterator_seed=20200205, )


for fold, subj in enumerate(subjs):
    suffix = '_s' + str(subj) + '_f' + str(fold)
    checkpoint = torch.load(pjoin(modelpath, 'model_f' + str(fold) + '.pt'),
                            map_location='cuda:' + str(args.gpu))

    # Set up the model.
    reset_model(checkpoint)
    model.fit(X_train, Y_train, 0, BATCH_SIZE)

    X, Y = get_data(subj)
    X_test, Y_test = X[300:], Y[300:]
    test_loss = model.evaluate(X_test, Y_test)
    with open(pjoin(outpath, 'test_base' + suffix + '.json'), 'w') as f:
        json.dump(test_loss, f)

dfile.close()
