Source Code for "Adaptive Transfer Learning with Deep CNN for EEG Motor Imagery Classification".

## Citation
```
TBD
```

## Resources
- Raw Dataset: [Link](http://gigadb.org/dataset/100542)
- Pre-trained subject-independent model: [Link](https://entuedu-my.sharepoint.com/:u:/g/personal/kzhang015_e_ntu_edu_sg/EfHL2P43oP1KkNGz7dn1EvEBauP6KQ-5KxMzgGcPCaS3oA?e=K72Wzr)
- Evaluation result: [Link](https://entuedu-my.sharepoint.com/:u:/g/personal/kzhang015_e_ntu_edu_sg/EZW09DGaiQhDpU2LMGWp3tcBrY_qIVXzq1RusLWtlP6Tww?e=SpNZou)

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

This process is likely to take some time. We have provided a pre-trained model in the [resources](#resources) above.

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
