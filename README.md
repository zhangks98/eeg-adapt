Codes for adaptation of a subject-independent deep convolutional neural network (CNN) based electroencephalography (EEG)-BCI system for decoding hand motor imagery (MI). Five schemes are presented, each of which fine-tunes an extensively trained, pre-trained model and adapt it to enhance the evaluation performance on a target subject.

## Citation
```
@article{ZHANG20211,
title = "Adaptive transfer learning for EEG motor imagery classification with deep Convolutional Neural Network",
journal = "Neural Networks",
volume = "136",
pages = "1 - 10",
year = "2021",
issn = "0893-6080",
doi = "https://doi.org/10.1016/j.neunet.2020.12.013",
url = "http://www.sciencedirect.com/science/article/pii/S0893608020304305",
author = "Kaishuo Zhang and Neethu Robinson and Seong-Whan Lee and Cuntai Guan",
}
```

## Summary of Results

| Methodology | Mean (SD) | Median | Range (Max-Min) |
|-|-|-|-|
| Subject-Specific | 63.54 (14.25) | 60.50 | 57.00 (100.00-43.00) |
| Subject-Independent | 84.19 (9.98) | 84.50 | 47.50 (99.50-52.00) |
| Subject-Adaptive<br>(Scheme 4, 80%) | 86.89 (11.41) | 88.50 | 44.00 (100.00-56.00) |

A detailed subject-level result can be found in [result_table.pdf](result_table.pdf)

## Resources
- Raw Dataset: [Link](http://gigadb.org/dataset/100542)
- Sample pre-trained subject-independent model: [Link](https://github.com/zhangks98/eeg-adapt/tree/master/pretrained_models)

## Instructions
### Install the dependencies
It is recommended to create a virtual environment and activate it before running the following:
```sh
pip install -r requirements.txt
```

### Obtain the raw dataset
Download the raw dataset from the [resources](#resources) above, and save them to the same folder. To conserve space, you may only download files that ends with `EEG_MI.mat`.

### Pre-process the raw dataset
The following command will read the raw dataset from the `$source` folder, and output the pre-processed data `KU_mi_smt.h5` into the `$target` folder.
```sh
python preprocess_h5_smt.py $source $target
```

### Training and evaluation
#### Subject-specific classification
```
usage: train_within.py [-h] [-gpu GPU] [-start START] [-end END] [-subj SUBJ [SUBJ ...]] datapath outpath

Subject-specific classification with KU Data

positional arguments:
  datapath              Path to the h5 data file
  outpath               Path to the result folder

optional arguments:
  -h, --help            show this help message and exit
  -gpu GPU              The gpu device index to use
  -start START          Start of the subject index
  -end END              End of the subject index (not inclusive)
  -subj SUBJ [SUBJ ...]
                        Explicitly set the subject number. This will override the start and end argument
```
To train the subject-specific model for all subjects, run
```sh
python train_within.py $datapath $outpath
```

#### Subject-independent classification
```
usage: train_base.py [-h] -fold FOLD [-gpu GPU] datapath outpath

Subject independent classification with KU Data

positional arguments:
  datapath    Path to the h5 data file
  outpath     Path to the result folder

optional arguments:
  -h, --help  show this help message and exit
  -fold FOLD  k-fold index, starts with 0
  -gpu GPU    The gpu device to use
```
The `$fold` index has a one-to-one mapping to the subject index, as we have shuffled the subjects in a pre-defined order (using random seed 20200205). This is listed in [subj-to-fold.csv](subj-to-fold.csv) file.

To train the subject-independent model for all subjects, run
```sh
python train_base.py $datapath $outpath -fold $fold
```
for `$fold` ranging [0...53] inclusive.

This process is likely to take some time. We have provided some sample pre-trained models in the [resources](#resources) above.

#### Subject-adaptive classification
```
usage: train_adapt.py [-h] [-scheme SCHEME] [-trfrate TRFRATE] [-lr LR] [-gpu GPU] datapath modelpath outpath

Subject adaptative classification with KU Data

positional arguments:
  datapath          Path to the h5 data file
  modelpath         Path to the base model folder
  outpath           Path to the result folder

optional arguments:
  -h, --help        show this help message and exit
  -scheme SCHEME    Adaptation scheme
  -trfrate TRFRATE  The percentage of data for adaptation
  -lr LR            Learning rate
  -gpu GPU          The gpu device to use
```
As an example, to train the subject-adaptive model for all subjects using the default configuration (scheme 4, adaptation rate 100%, learning rate 0.0005), run: 
```sh
python train_adapt.py $datapath $modelpath $outpath
```
The `$modelpath` corresponds to the result folder of the [subject-independent classification](#subject-independent-classification), or the path to the pre-trained model.

### Training on multiple GPUs
To speed up training, you can make use of multiple GPUs. In the `tasks_*` folder, we provide a sample script for training on 8 GPUs. To generate these scripts, run:
```sh
python generate.py
```
