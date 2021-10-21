#!/usr/bin/env python
# coding: utf-8
'''Subject-independent classification with KU Data,
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
from os import makedirs
from os.path import join as pjoin
from shutil import copy2, move

import h5py
import numpy as np
import torch
import torch.nn.functional as F
from signal_target import SignalAndTarget
from braindecode.models.deep4 import Deep4Net
#from braindecode.torch_ext.optimizers import AdamW
from optimizers import AdamW
#from braindecode.torch_ext.util import set_random_seeds
from util import set_random_seeds
from sklearn.model_selection import KFold

logging.basicConfig(format='%(asctime)s %(levelname)s : %(message)s',
                    level=logging.INFO, stream=sys.stdout)

parser = argparse.ArgumentParser(
    description='Subject-independent classification with KU Data')
parser.add_argument('datapath', type=str, help='Path to the h5 data file')
parser.add_argument('outpath', type=str, help='Path to the result folder')
parser.add_argument('-fold', type=int,
                    help='k-fold index, starts with 0', required=True)
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
cv_set = np.array(subjs[fold+1:] + subjs[:fold])
kf = KFold(n_splits=6)

dfile = h5py.File(datapath, 'r')
torch.cuda.set_device(args.gpu)
#torch.cuda.manual_seed(seed=20200205)
set_random_seeds(seed=20200205, cuda=True)
BATCH_SIZE = 16
TRAIN_EPOCH = 200  # consider 200 for early stopping

# Get data from single subject.


def get_data(subj):
    dpath = '/s' + str(subj)
    X = dfile[pjoin(dpath, 'X')]
    Y = dfile[pjoin(dpath, 'Y')]
    return X, Y


def get_multi_data(subjs):
    Xs = []
    Ys = []
    for s in subjs:
        x, y = get_data(s)
        Xs.append(x[:])
        Ys.append(y[:])
    X = np.concatenate(Xs, axis=0)
    Y = np.concatenate(Ys, axis=0)
    return X, Y


cv_loss = []
for cv_index, (train_index, test_index) in enumerate(kf.split(cv_set)):

    train_subjs = cv_set[train_index]
    valid_subjs = cv_set[test_index]
    X_train, Y_train = get_multi_data(train_subjs)
    X_val, Y_val = get_multi_data(valid_subjs)
    X_test, Y_test = get_data(test_subj)
    train_set = SignalAndTarget(X_train, y=Y_train)
    valid_set = SignalAndTarget(X_val, y=Y_val)
    test_set = SignalAndTarget(X_test[200:], y=Y_test[200:])
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
        outpath, 'model_f{}_cv{}.pt'.format(fold, cv_index)))
    model.epochs_df.to_csv(
        pjoin(outpath, 'epochs_f{}_cv{}.csv'.format(fold, cv_index)))
    cv_loss.append(rememberer.lowest_val)

    test_loss = model.evaluate(test_set.X, test_set.y)
    with open(pjoin(outpath, 'test_base_s{}_f{}_cv{}.json'.format(test_subj, fold, cv_index)), 'w') as f:
        json.dump(test_loss, f)

best_cv = np.argmin(cv_loss)
best_dir = pjoin(outpath, "best")
makedirs(best_dir, exist_ok=True)
with open(pjoin(best_dir, "fold_bestcv.txt"), 'a') as f:
    f.write("{}, {}\n".format(fold, best_cv))
copy2(pjoin(outpath, 'model_f{}_cv{}.pt'.format(fold, best_cv)),
      pjoin(best_dir, 'model_f{}.pt'.format(fold)))
copy2(pjoin(outpath, 'epochs_f{}_cv{}.csv'.format(fold, best_cv)),
      pjoin(best_dir, 'epochs_f{}.csv'.format(fold)))
copy2(pjoin(outpath, 'test_base_s{}_f{}_cv{}.json'.format(test_subj, fold, best_cv)),
      pjoin(best_dir, 'test_base_s{}_f{}.json'.format(test_subj, fold)))
dfile.close()
