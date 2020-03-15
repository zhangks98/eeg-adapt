hostname
nvidia-smi
# Container starting directory determined by settings in Docker image
# For NVIDIA NGC containers this is normally /workspace
echo Container starts in the directory:
pwd
# Install required packages
# Set environment variable to install packages to world-writable location inside container
export PYTHONUSERBASE=/workspace/.local
# Escaping PYTHONUSERBASE in the next line so that it is expanded inside docker and take the value set inside the container
mkdir -p $PYTHONUSERBASE/bin
export PATH=$PATH:$PYTHONUSERBASE/bin
echo PATH inside container
echo PATH=$PATH
pip install -U -q --no-cache-dir --user braindecode

# change directory to correct location if required
cd /home/users/ntu/kzhang01/hbm/transfer
echo Changed working directory to
pwd

datapath=/home/users/ntu/kzhang01/scratch/KU_mi_smt.h5
modelpath=/home/users/ntu/kzhang01/hbm/transfer/result_base
logpath=/home/users/ntu/kzhang01/hbm/transfer/tasks_adapt
# Fix file locking disabled on this file system (/scratch) when reading hdf5
export HDF5_USE_FILE_LOCKING='FALSE'

python train_adapt.py $datapath $modelpath ./result_adapt/r10 -scheme 1 -trfrate 10 -gpu 0 > $logpath/stdout.r10.out &
python train_adapt.py $datapath $modelpath ./result_adapt/r20 -scheme 1 -trfrate 20 -gpu 1 > $logpath/stdout.r20.out &
python train_adapt.py $datapath $modelpath ./result_adapt/r30 -scheme 1 -trfrate 30 -gpu 2 > $logpath/stdout.r30.out &
python train_adapt.py $datapath $modelpath ./result_adapt/r40 -scheme 1 -trfrate 40 -gpu 3 > $logpath/stdout.r40.out &
python train_adapt.py $datapath $modelpath ./result_adapt/r50 -scheme 1 -trfrate 50 -gpu 4 > $logpath/stdout.r50.out &
python train_adapt.py $datapath $modelpath ./result_adapt/r60 -scheme 1 -trfrate 60 -gpu 5 > $logpath/stdout.r60.out &
python train_adapt.py $datapath $modelpath ./result_adapt/r70 -scheme 1 -trfrate 70 -gpu 6 > $logpath/stdout.r70.out &
python train_adapt.py $datapath $modelpath ./result_adapt/r80 -scheme 1 -trfrate 80 -gpu 7 > $logpath/stdout.r80.out &
wait