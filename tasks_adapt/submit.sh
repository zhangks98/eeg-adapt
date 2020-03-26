#!/bin/bash

for scheme in {1..5}
do
    cd tasks_adapt${scheme}
    for job in {0..1} 
    do
        qsub train.${job}.pbs
    done
    cd ..
done
