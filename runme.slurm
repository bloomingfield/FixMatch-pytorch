#!/bin/bash
#SBATCH --partition gpgpu
#SBATCH --qos=gpgpuresplat

#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks=6
#SBATCH --time=23:59:59
#SBATCH --output fixmatch250.out
#SBATCH --open-mode=truncate
#SBATCH --job-name=fixmatch250
#SBATCH --mail-type=ALL
#SBATCH --mail-user=nathaniel.bloomfield@unimelb.edu.au


module load fosscuda/2020b
module load pytorch/1.9.0-python-3.8.6

cd /data/cephfs/punim0980/FixMatch-pytorch

python3 train.py --dataset cifar10 --num-labeled 250 --arch wideresnet --batch-size 64 --lr 0.03 --expand-labels --seed 5 --out results/cifar10@250.5
