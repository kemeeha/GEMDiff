#!/bin/bash

#SBATCH --job-name=PERTURB      # Set the job name
#SBATCH --nodes 1
#SBATCH --tasks-per-node 1
#SBATCH --cpus-per-task 4
#SBATCH --gpus a100:1
#SBATCH --mem 32gb
#SBATCH --time 04:00:00

#load modules
module load anaconda3/2023.09-0

#Go to working directory
cd /scratch/kemeeha/GEMDif_lab_04-15-2025/normal_tumor_transcriptome_transition_lab/GEMDiff

#Activate the created conda environment
source activate GEMDiff  #create before running script

#Perturb samples
###Make sure to change the model path which is found in the train log file.###
python scripts/perturb.py --config datasets/THCA.yaml --dir log  --model_path log/2025-04-02-11-06/model10000.pt --valid --gene_set datasets/THCATOP20MUTATE.txt
