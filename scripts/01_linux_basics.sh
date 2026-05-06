#!/bin/bash

echo "Current directory:"
pwd

echo "Files:"
ls -lh

echo "Create folder:"
mkdir -p results/demo

echo "Create text file:"
echo "Hello HPC course" > results/demo/hello.txt

echo "Show file content:"
cat results/demo/hello.txt

echo "Count lines:"
wc -l results/demo/hello.txt
