#!/bin/bash
#SBATCH --partition gpgpu
#SBATCH --qos=gpgpuresplat

#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks=6
#SBATCH --time=23:59:59
#SBATCH --output fixmatch403.out
#SBATCH --open-mode=truncate
#SBATCH --job-name=fixmatch403
#SBATCH --mail-type=ALL
#SBATCH --mail-user=nathaniel.bloomfield@unimelb.edu.au


module load fosscuda/2020b
module load pytorch/1.9.0-python-3.8.6

cd /data/cephfs/punim0980/FixMatch-pytorch2

python3 train.py --dataset cifar10 --num-labeled 40 --arch wideresnet --batch-size 64 --lr 0.03 --expand-labels --seed 5 --out results/cifar10@40.5.right3

