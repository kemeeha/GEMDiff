#!/bin/bash

#SBATCH --job-name=TRAIN     # Set the job name
#SBATCH --nodes 1
#SBATCH --tasks-per-node 1
#SBATCH --cpus-per-task 4
#SBATCH --gpus a100:1
#SBATCH --mem 32gb
#SBATCH --time 24:00:00

#load modules
module load anaconda3/2023.09-0

#Go to working directory
cd /scratch/kemeeha/GEMDif_lab_04-15-2025/normal_tumor_transcriptome_transition_lab

# activate the created conda environment
source activate GEMDiff  #create before running script

# clone the package
rm GEMDiff -rf
git clone https://github.com/xai990/GEMDiff.git
cd GEMDiff
pip install -e . 

#Move datasets to GEMDiff
cp ../datasets . -r

#train the model
python scripts/train.py --config datasets/THCA.yaml --dir log --gene_set datasets/THCATOP20MUTATE.txt
