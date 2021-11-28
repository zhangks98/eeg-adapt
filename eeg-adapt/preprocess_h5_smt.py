'''Preprocessor for KU Data.
'''
import argparse
from os.path import join as pjoin

import h5py
import numpy as np
from scipy.io import loadmat
from scipy.signal import decimate
from tqdm import tqdm

parser = argparse.ArgumentParser(
    description='Preprocessor for KU Data')
parser.add_argument('source', type=str, help='Path to raw KU data')
parser.add_argument('target', type=str, help='Path to pre-processed KU data')
parser.add_argument('--foldered-data', action='store_true',
                    help='DEPRECATED. DO NOT use this option ' +
                    'if the data is downloaded from GigaDB.')
args = parser.parse_args()

src = args.source
out = args.target
is_foldered = args.foldered_data


def get_data(sess, subj):
    if is_foldered:
        filename = pjoin('session' + str(sess), 's' + str(subj), 'EEG_MI.mat')
    else:
        filename = 'sess{:02d}_subj{:02d}_EEG_MI.mat'.format(sess, subj)
    filepath = pjoin(src, filename)
    raw = loadmat(filepath)
    # Obtain input, convert (time, epoch, chan) into (epoch, chan, time)
    X1 = np.moveaxis(raw['EEG_MI_train']['smt'][0][0], 0, -1)
    X1 = decimate(X1, 4)
    X2 = np.moveaxis(raw['EEG_MI_test']['smt'][0][0], 0, -1)
    X2 = decimate(X2, 4)
    X = np.concatenate((X1, X2), axis=0)
    # Obtain target: 0 -> right, 1 -> left
    Y1 = (raw['EEG_MI_train']['y_dec'][0][0][0] - 1)
    Y2 = (raw['EEG_MI_test']['y_dec'][0][0][0] - 1)
    Y = np.concatenate((Y1, Y2), axis=0)
    return X, Y


with h5py.File(pjoin(out, 'KU_mi_smt.h5'), 'w') as f:
    for subj in tqdm(range(1, 55)):
        X1, Y1 = get_data(1, subj)
        X2, Y2 = get_data(2, subj)
        X = np.concatenate((X1, X2), axis=0)
        X = X.astype(np.float32)
        Y = np.concatenate((Y1, Y2), axis=0)
        Y = Y.astype(np.int64)
        f.create_dataset('s' + str(subj) + '/X', data=X)
        f.create_dataset('s' + str(subj) + '/Y', data=Y)
