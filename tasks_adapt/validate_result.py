'''Training result validator for adaptive classification with KU data.
'''
import argparse
import re
from os import listdir
from os.path import join as pjoin

parser = argparse.ArgumentParser(
    description='Training result validator for adaptive classification with KU data')
parser.add_argument('resultpath', type=str,
                    help='Path to folder containing result_adapt*')
args = parser.parse_args()
path = args.resultpath
schemes = ["result_adapt{}".format(i) for i in range(1, 6)]
p = re.compile(r"epochs_s(\d+)_f(\d+)\.csv")
valid = True
for scheme in schemes:
    for i in range(10):
        rate = (i + 1) * 10
        fs = listdir(pjoin(path, scheme, "r{}".format(rate)))
        mat = [p.match(s) for s in fs]
        grp = [[int(n) for n in m.groups()] for m in mat if m is not None]
        if grp:
            subjs, _ = zip(*grp)
        else:
            subjs = []
        subjs = set(subjs)
        if len(subjs) != 54:
            valid = False
            print("Missing result for {} rate {}".format(scheme, rate))
            curr = len(subjs)
            miss_subjs = set(range(1, 55)) - subjs
            print('Missing subjs: ', miss_subjs)

if valid:
    print('No missing result detected, Looking good!!')
