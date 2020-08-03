#!/bin/sh

### The following requests all resources on 1 DGX-1 node
#PBS -l select=1:ncpus=40:ngpus=8

### The "select=1" specifies the number of nodes
### The "ncpus=40:ngpus=8" asks for acccess to all 8 GPU cards
### If you request less than 8 GPU then make the ncpus value
###   five times the ngpus value, e.g. select=1:ncpus=5:ngpus=1

### Specify amount of time required
###  values less than 4 hours go into a higher priority queue
#PBS -l walltime=23:59:59

### Specify DGX queue
#PBS -q dgx

### Specify project code
### e.g. 41000001 was the pilot project code
###      Personal is your personal lifetime allowance
### Job will not submit unless this is changed
#PBS -P 12001577

### Specify name for job
#PBS -N train_within_{0}

### Send email notification
#PBS -WMail_Users=kzhang015@e.ntu.edu.sg

### Standard output by default goes to file $PBS_JOBNAME.o$PBS_JOBID
### Standard error by default goes to file $PBS_JOBNAME.e$PBS_JOBID
### To merge standard output and error use the following
#PBS -j oe

### Start of commands to be run

# Docker image to use for container
#   To see available images run command: nscc-docker images
#   If image is not present, email help@nscc.sg to request pulling image into repository on all DGX nodes
image="nvcr.io/nvidia/pytorch:20.01-py3"

# Change to directory where job was submitted
cd "$PBS_O_WORKDIR" || exit $?
# Please note that when you start a Docker container then inside the container it will start in a different directory
# You will also need to change to the correct directory inside the container

# The "nscc-docker run $image" command runs the following Docker command: 
#    nvidia-docker -u $UID:$GID -v /home:/home -v /raid:/raid --rm -i --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 $image /bin/sh
# See full list of options with "nscc-docker run -h"
# Pass the commands that you wish to run inside the container on the standard input
# Edit file stdin as required
nscc-docker run $image < script.{0}.sh # > stdout.$PBS_JOBID 2> stderr.$PBS_JOBID
