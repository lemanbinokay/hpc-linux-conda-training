#!/bin/bash

source /opt/conda/etc/profile.d/conda.sh
conda activate hpc_course

mkdir -p results/seqkit

echo "Running seqkit stats:"
seqkit stats data/example.fasta > results/seqkit/example_stats.txt

echo "Output:"
cat results/seqkit/example_stats.txt
