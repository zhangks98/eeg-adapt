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
datapath=/home/users/ntu/kzhang01/scratch/KU_mi_smt.h5
outpath=/home/users/ntu/kzhang01/hbm/transfer/result_base
logpath=/home/users/ntu/kzhang01/hbm/transfer/tasks_base
# Fix file locking disabled on this file system (/scratch) when reading hdf5
export HDF5_USE_FILE_LOCKING='FALSE'

python /home/users/ntu/kzhang01/hbm/transfer/train_base.py $datapath $outpath -fold 8 -gpu 0 > $logpath/stdout.f8.out &
python /home/users/ntu/kzhang01/hbm/transfer/train_base.py $datapath $outpath -fold 9 -gpu 1 > $logpath/stdout.f9.out &
python /home/users/ntu/kzhang01/hbm/transfer/train_base.py $datapath $outpath -fold 10 -gpu 2 > $logpath/stdout.f10.out &
python /home/users/ntu/kzhang01/hbm/transfer/train_base.py $datapath $outpath -fold 11 -gpu 3 > $logpath/stdout.f11.out &
python /home/users/ntu/kzhang01/hbm/transfer/train_base.py $datapath $outpath -fold 12 -gpu 4 > $logpath/stdout.f12.out &
python /home/users/ntu/kzhang01/hbm/transfer/train_base.py $datapath $outpath -fold 13 -gpu 5 > $logpath/stdout.f13.out &
python /home/users/ntu/kzhang01/hbm/transfer/train_base.py $datapath $outpath -fold 14 -gpu 6 > $logpath/stdout.f14.out &
python /home/users/ntu/kzhang01/hbm/transfer/train_base.py $datapath $outpath -fold 15 -gpu 7 > $logpath/stdout.f15.out &
wait