#!/bin/bash
source activate capstone && pylint --disable=R,C,W1203 hello.py
