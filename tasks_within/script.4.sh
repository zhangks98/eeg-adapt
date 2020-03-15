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
outpath=/home/users/ntu/kzhang01/hbm/transfer/result_within
# Fix file locking disabled on this file system (/scratch) when reading hdf5
export HDF5_USE_FILE_LOCKING='FALSE'
python /home/users/ntu/kzhang01/hbm/transfer/train_within.py $datapath $outpath --start 29 --end 36
