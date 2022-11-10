#!/bin/bash

#SBATCH --job-name=siph_iqtree
#SBATCH --time=30:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

module load MAFFT

mafft Pleth_Prelim.fasta>Pleth_Prelim.aligned.fasta
