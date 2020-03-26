#!/usr/bin/env python
# coding: utf-8

import argparse
import json
import logging
import sys
from os.path import join as pjoin

import h5py
import numpy as np
import torch
import torch.nn.functional as F
from braindecode.datautil.signal_target import SignalAndTarget
from braindecode.models.deep4 import Deep4Net
from braindecode.torch_ext.optimizers import AdamW
from braindecode.torch_ext.util import set_random_seeds
from torch import nn

logging.basicConfig(format='%(asctime)s %(levelname)s : %(message)s',
                    level=logging.INFO, stream=sys.stdout)

parser = argparse.ArgumentParser(
    description='Subject independent classification with KU Data')
parser.add_argument('datapath', type=str, help='Path to data')
parser.add_argument('outpath', type=str, help='Path to output')
parser.add_argument('-fold', type=int, help='k-fold index, starts with 0')
parser.add_argument('-gpu', type=int, help='The gpu device to use', default=0)

args = parser.parse_args()
datapath = args.datapath
outpath = args.outpath
fold = args.fold
assert(fold >= 0 and fold < 54)
# Randomly shuffled subject.
subjs = [35, 47, 46, 37, 13, 27, 12, 32, 53, 54, 4, 40, 19, 41, 18, 42, 34, 7,
         49, 9, 5, 48, 29, 15, 21, 17, 31, 45, 1, 38, 51, 8, 11, 16, 28, 44, 24,
         52, 3, 26, 39, 50, 6, 23, 2, 14, 25, 20, 10, 33, 22, 43, 36, 30]
test_subj = subjs[fold]
train_subjs = subjs[fold+1:min(54, fold+46)] + subjs[:max(0, fold-8)]
valid_subjs = subjs[max(0, fold-8):fold] + subjs[min(fold-8+54, 54):]

dfile = h5py.File(datapath, 'r')
torch.cuda.set_device(args.gpu)
set_random_seeds(seed=20200205, cuda=True)
BATCH_SIZE = 16
TRAIN_EPOCH = 200  # consider 200 for early stopping

# Get data from single subject.


def get_data(subj):
    dpath = '/s' + str(subj)
    X = dfile[pjoin(dpath, 'X')]
    Y = dfile[pjoin(dpath, 'Y')]
    return X, Y


def get_multi_data(subjs, array_fn):
    Xs = []
    Ys = []
    for s in subjs:
        x, y = get_data(s)
        Xs.append(array_fn(x))
        Ys.append(array_fn(y))
    X = np.concatenate(Xs, axis=0)
    Y = np.concatenate(Ys, axis=0)
    return X, Y


# Generate data from command-line arguments.
X_train, Y_train = get_multi_data(train_subjs, lambda a: a[:])
X_val, Y_val = get_multi_data(valid_subjs, lambda a: a[:])
X_test, Y_test = get_data(test_subj)
train_set = SignalAndTarget(X_train, y=Y_train)
valid_set = SignalAndTarget(X_val, y=Y_val)
test_set = SignalAndTarget(X_test[200:], y=Y_test[200:])
# set_random_seeds(seed=20170629, cuda=cuda)
n_classes = 2
in_chans = train_set.X.shape[1]

# final_conv_length = auto ensures we only get a single output in the time dimension
model = Deep4Net(in_chans=in_chans, n_classes=n_classes,
                 input_time_length=train_set.X.shape[2],
                 final_conv_length='auto').cuda()
# these are good values for the deep model
optimizer = AdamW(model.parameters(), lr=1*0.01, weight_decay=0.5*0.001)
model.compile(loss=F.nll_loss, optimizer=optimizer, iterator_seed=1, )

# Fit the base model for transfer learning, use early stopping as a hack to remember the model
exp = model.fit(train_set.X, train_set.y, epochs=TRAIN_EPOCH, batch_size=BATCH_SIZE, scheduler='cosine',
                validation_data=(valid_set.X, valid_set.y), remember_best_column='valid_loss')
rememberer = exp.rememberer
base_model_param = {
    'epoch': rememberer.best_epoch,
    'model_state_dict': rememberer.model_state_dict,
    'optimizer_state_dict': rememberer.optimizer_state_dict,
    'loss': rememberer.lowest_val
}
torch.save(base_model_param, pjoin(
    outpath, 'model_f' + str(fold) + '.pt'))
model.epochs_df.to_csv(pjoin(outpath, 'epochs_f' + str(fold) + '.csv'))

test_loss = model.evaluate(test_set.X, test_set.y)
with open(pjoin(outpath, 'test_base_s' + str(test_subj) + '_f' + str(fold) + '.json'), 'w') as f:
    json.dump(test_loss, f)

dfile.close()
