#!/bin/bash

source /opt/conda/etc/profile.d/conda.sh
conda activate hpc_course

mkdir -p results/loop_demo

for file in data/*.fasta
do
  sample=$(basename "$file" .fasta)
  echo "Processing sample: $sample"
  seqkit stats "$file" > results/loop_demo/${sample}_stats.txt
done

echo "Loop completed."
