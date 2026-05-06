#!/bin/bash

echo "1. Linux basics"
bash scripts/01_linux_basics.sh

echo "2. Conda basics"
bash scripts/02_conda_basics.sh

echo "3. Run bioinformatics tool"
bash scripts/03_run_tool.sh

echo "4. Bash loop demo"
bash scripts/04_bash_variables_loop.sh

echo "Local workflow completed."
echo "SLURM scripts are under slurm/ and should be run on a real HPC server."
