#!/bin/bash

for scheme in {1..5}
do
    cd tasks_adapt${scheme}
    qsub train.0.pbs
    cd ..
done

cd tasks_adaptr
for job in {0..1} 
do
    qsub train.${job}.pbs
done
