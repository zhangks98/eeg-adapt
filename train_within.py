#!/usr/bin/env python
# coding: utf-8

import argparse
import json
import logging
import sys
from os.path import dirname
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
    description='Subject-specific classification with KU Data')
parser.add_argument('datapath', type=str, help='Path to data')
parser.add_argument('outpath', type=str, help='Path to output')
parser.add_argument('--gpu', type=int,
                    help='The gpu device index to use', default=0)
parser.add_argument('--start', type=int,
                    help='Start of the subject index', default=1)
parser.add_argument(
    '--end', type=int, help='End of the subject index (not inclusive)', default=55)
parser.add_argument('--subj', type=int, nargs='+',
                    help='Explicitly set the subject number')
args = parser.parse_args()

datapath = args.datapath
outpath = args.outpath
start = args.start
end = args.end
assert(start < end)
subjs = args.subj if args.subj else range(start, end)
dfile = h5py.File(datapath, 'r')
# torch.cuda.set_device(args.gpu)
# set_random_seeds(seed=20200204, cuda=cuda)


def get_data(subj):
    dpath = '/s' + str(subj)
    X = dfile[pjoin(dpath, 'X')]
    Y = dfile[pjoin(dpath, 'Y')]
    return X[:], Y[:]


def get_and_split_data(subj):
    X, Y = get_data(subj)
    # Shuffle the data.
    X_train, X_test = X[:200], X[200:]
    Y_train, Y_test = Y[:200], Y[200:]
    return X_train, Y_train, X_test, Y_test


for subj in subjs:
    # Get data for within-subject classification
    X_train, Y_train, X_test, Y_test = get_and_split_data(subj)
    test_set = SignalAndTarget(X_test, y=Y_test)
    folds = np.random.permutation(200).tolist()
    test_loss = []
    print('Subject', subj)
    for it in range(10):
        val_index = folds[it*20:it*20+20]
        train_index = folds[:it*20] + folds[it*20+20:]
        train_set = SignalAndTarget(
            X_train[train_index], y=Y_train[train_index])
        valid_set = SignalAndTarget(X_train[val_index], y=Y_train[val_index])

        suffix = 's' + str(subj) + '_f' + str(it)
        n_classes = 2
        in_chans = train_set.X.shape[1]

        # final_conv_length = auto ensures we only get a single output in the time dimension
        model = Deep4Net(in_chans=in_chans, n_classes=n_classes,
                         input_time_length=train_set.X.shape[2],
                         final_conv_length='auto').cuda()

        # these are good values for the deep model
        optimizer = AdamW(model.parameters(), lr=1 *
                          0.01, weight_decay=0.5*0.001)
        model.compile(loss=F.nll_loss, optimizer=optimizer, iterator_seed=1, )

        model.fit(train_set.X, train_set.y, epochs=200, batch_size=16, scheduler='cosine',
                  validation_data=(valid_set.X, valid_set.y), remember_best_column='valid_loss')

        test_loss.append(model.evaluate(test_set.X, test_set.y))
        model.epochs_df.to_csv(pjoin(outpath, 'epochs_' + suffix + '.csv'))
    with open(pjoin(outpath, 'test_subj_' + str(subj) + '.json'), 'w') as f:
        json.dump(test_loss, f)

dfile.close()
