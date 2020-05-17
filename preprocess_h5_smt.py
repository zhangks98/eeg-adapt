from os.path import dirname, join as pjoin
from scipy.io import loadmat
from scipy.signal import decimate
from tqdm import tqdm
import numpy as np
import h5py


def get_data(sess, subj):
    folder = '/media/data/KU_data'
    session = 'session' + str(sess)
    subject = 's' + str(subj)
    filepath = pjoin(folder, session, subject, 'EEG_MI.mat')
    raw = loadmat(filepath)
    # Obtain input, convert (time, epoch, chan) into (epoch, chan, time)
    X1 = np.moveaxis(raw['EEG_MI_train']['smt'][0]
                     [0], 0, -1).astype(np.float32)
    X1 = decimate(X1, 4)
    X2 = np.moveaxis(raw['EEG_MI_test']['smt'][0][0], 0, -1).astype(np.float32)
    X2 = decimate(X2, 4)
    X = np.concatenate((X1, X2), axis=0)
    # Obtain target: 0 -> right, 1 -> left
    Y1 = (raw['EEG_MI_train']['y_dec'][0][0][0] - 1).astype(np.int64)
    Y2 = (raw['EEG_MI_test']['y_dec'][0][0][0] - 1).astype(np.int64)
    Y = np.concatenate((Y1, Y2), axis=0)
    return X, Y


with h5py.File('/media/data/KU_h5/KU_mi_smt.h5', 'w') as f:
    for subj in tqdm(range(1, 55)):
        X1, Y1 = get_data(1, subj)
        X2, Y2 = get_data(2, subj)
        X = np.concatenate((X1, X2), axis=0)
        Y = np.concatenate((Y1, Y2), axis=0)
        f.create_dataset('s' + str(subj) + '/X', data=X)
        f.create_dataset('s' + str(subj) + '/Y', data=Y)
