#!/bin/bash
source ~/anaconda3/etc/profile.d/conda.sh
conda activate capstone
pylint --disable=R,C,W1203 hello.py
