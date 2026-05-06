#!/bin/bash

source /opt/conda/etc/profile.d/conda.sh

echo "Available conda environments:"
conda env list

echo "Activate hpc_course environment:"
conda activate hpc_course

echo "Check seqkit:"
which seqkit
seqkit version

echo "Check fastqc:"
which fastqc
fastqc --version
