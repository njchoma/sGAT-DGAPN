#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate my-rdkit-new

DATA=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

PYARGS=""
PYARGS="$PYARGS --name DGAPN_parallel_8_noemb"
PYARGS="$PYARGS --gpu 2"
PYARGS="$PYARGS --nb_procs 8"
PYARGS="$PYARGS --data_path $DATA/src/dataset"
PYARGS="$PYARGS --warm_start_dataset_path $DATA/src/dataset/NSP15_6W01_A_3_H.negonly_unique_30k.csv" # zinc_plogp_sorted.csv
PYARGS="$PYARGS --artifact_path $DATA/artifact/dgapn"
PYARGS="$PYARGS --embed_model_path $DATA/artifact/A3H_embed_3d.pth"
PYARGS="$PYARGS --reward_type dock"

python src/main_dgapn.py $PYARGS
