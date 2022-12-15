#!/bin/bash

#SBATCH --job-name=siph_iqtree
#SBATCH --time=30:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

module load MAFFT

mafft Pleth_final_nd2.fasta>Pleth_final_nd2.aligned.fasta

module load IQ-TREE/1.6.12

iqtree -s Pleth_final_nd2.aligned.fasta -nt AUTO
