#!/bin/bash
#SBATCH --job-name=seqkit_demo
#SBATCH --output=results/slurm_%j.out
#SBATCH --error=results/slurm_%j.err
#SBATCH --time=00:05:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

source /opt/conda/etc/profile.d/conda.sh
conda activate hpc_course

echo "Job started"
echo "Running on node:"
hostname

echo "Working directory:"
pwd

mkdir -p results/slurm_demo

seqkit stats data/example.fasta > results/slurm_demo/seqkit_stats_from_slurm.txt

echo "Job finished"
