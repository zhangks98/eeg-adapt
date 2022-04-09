#!/usr/bin/env python
# coding: utf-8
'''Subject-specific classification with KU Data,
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

#from braindecode.models.deep4 import Deep4Net
from quantized_deep4 import QuantDeep4Net
from braindecode.torch_ext.optimizers import AdamW
from braindecode.torch_ext.util import set_random_seeds

logging.basicConfig(format='%(asctime)s %(levelname)s : %(message)s',
                    level=logging.INFO, stream=sys.stdout)
parser = argparse.ArgumentParser(
    description='Subject-specific classification with KU Data')
parser.add_argument('datapath', type=str, help='Path to the h5 data file')
parser.add_argument('outpath', type=str, help='Path to the result folder')
parser.add_argument('-gpu', type=int,
                    help='The gpu device index to use', default=0)
parser.add_argument('-start', type=int,
                    help='Start of the subject index', default=1)
parser.add_argument(
    '-end', type=int, help='End of the subject index (not inclusive)', default=55)
parser.add_argument('-subj', type=int, nargs='+',
                    help='Explicitly set the subject number. This will override the start and end argument')
args = parser.parse_args()

datapath = args.datapath
outpath = args.outpath
start = args.start
end = args.end
assert(start < end)
subjs = args.subj if args.subj else range(start, end)
dfile = h5py.File(datapath, 'r')
torch.cuda.set_device(args.gpu)
set_random_seeds(seed=20200205, cuda=True)

def get_data(subj):
    dpath = '/s' + str(subj)
    X = dfile[pjoin(dpath, 'X')]
    Y = dfile[pjoin(dpath, 'Y')]
    return X[:], Y[:]


for subj in subjs:
    # Get data for within-subject classification
    X, Y = get_data(subj)
    #print('Shape: ', X.shape)
    X_train, Y_train = X[50:250], Y[50:250]
    X_val, Y_val = X[250:300], Y[250:300]
    X_test, Y_test = X[300:], Y[300:]

    suffix = 's' + str(subj)
    n_classes = 2
    in_chans = X.shape[1]

    # final_conv_length = auto ensures we only get a single output in the time dimension
    model = QuantDeep4Net(in_chans=in_chans, n_classes=n_classes,
                     input_time_length=X.shape[2],
                     final_conv_length=1, split_first_layer=False, quant_bit_width=2).cuda()

    # these are good values for the deep model
    optimizer = AdamW(model.parameters(), lr=1 * 0.01, weight_decay=0.5*0.001)
    model.compile(loss=F.nll_loss, optimizer=optimizer, iterator_seed=1, )
    
    model.fit(X_train, Y_train, epochs=200, batch_size=16, scheduler='cosine', 
            validation_data=(X_val, Y_val))#, remember_best_column='valid_loss')

    test_loss = model.evaluate(X_test, Y_test)
    print(test_loss)
    model.epochs_df.to_csv(pjoin(outpath, 'epochs_' + suffix + '.csv'))
    with open(pjoin(outpath, 'test_subj_' + str(subj) + '.json'), 'w') as f:
        json.dump(test_loss, f)
    

dfile.close()
