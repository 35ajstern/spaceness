#!/bin/bash
# run gwas for all files in a directory using 4 phenotyping schemes
cd ~/projects/spaceness

#spatial mate choice sims
files=~/projects/spaceness/sims/slimout/spatial/W50_run3/*
for f in $files
do

 command="python scripts/run_gwas.py \
 --infile $f \
 --outdir ~/projects/spaceness/gwas/point_sampling/out_normal \
 --plink_path ~/projects/plink-1.07-x86_64/plink \
 --vcftools_path ~/projects/vcftools_0.1.13/bin/vcftools \
 --nSamples 1000 \
 --sampling point \
 --mu 1e-8 \
 --phenotype gaussian \
 --phenotype_mean 100 \
 --phenotype_sd 10 \
 --gentimes ~/projects/spaceness/W50sp_gentimes.txt \
 --seed 12345"
 
cp ~/projects/spaceness/batch_scripts/slurm_gwas_header.srun ~/projects/spaceness/batch_scripts/tmp.srun

echo $command >> ~/projects/spaceness/batch_scripts/tmp.srun

sbatch ~/projects/spaceness/batch_scripts/tmp.srun

command="python scripts/run_gwas.py \
--infile $f \
--outdir ~/projects/spaceness/gwas/point_sampling/out_clinal \
--plink_path ~/projects/plink-1.07-x86_64/plink \
--vcftools_path ~/projects/vcftools_0.1.13/bin/vcftools \
--nSamples 1000 \
--sampling point \
--mu 1e-8 \
--phenotype transform_coord \
--phenotype_mean 100 \
--phenotype_sd 10 \
--gentimes ~/projects/spaceness/W50sp_gentimes.txt \
--seed 12345"

cp ~/projects/spaceness/batch_scripts/slurm_gwas_header.srun ~/projects/spaceness/batch_scripts/tmp.srun

echo $command >> ~/projects/spaceness/batch_scripts/tmp.srun

sbatch ~/projects/spaceness/batch_scripts/tmp.srun

command="python scripts/run_gwas.py \
 --infile $f \
 --outdir ~/projects/spaceness/gwas/point_sampling/out_corner \
 --plink_path ~/projects/plink-1.07-x86_64/plink \
 --vcftools_path ~/projects/vcftools_0.1.13/bin/vcftools \
 --nSamples 1000 \
 --sampling point \
 --mu 1e-8 \
 --phenotype corner_bimodal \
 --phenotype_mean 100 \
 --phenotype_sd 10 \
 --gentimes ~/projects/spaceness/W50sp_gentimes.txt \
 --seed 12345"
 
cp ~/projects/spaceness/batch_scripts/slurm_gwas_header.srun ~/projects/spaceness/batch_scripts/tmp.srun

echo $command >> ~/projects/spaceness/batch_scripts/tmp.srun

sbatch ~/projects/spaceness/batch_scripts/tmp.srun

command="python scripts/run_gwas.py \
 --infile $f \
 --outdir ~/projects/spaceness/gwas/point_sampling/out_patchy \
 --plink_path ~/projects/plink-1.07-x86_64/plink \
 --vcftools_path ~/projects/vcftools_0.1.13/bin/vcftools \
 --nSamples 1000 \
 --sampling point \
 --mu 1e-8 \
 --phenotype patchy \
 --phenotype_mean 100 \
 --phenotype_sd 10 \
 --gentimes ~/projects/spaceness/W50sp_gentimes.txt \
 --seed 12345"
 
cp ~/projects/spaceness/batch_scripts/slurm_gwas_header.srun ~/projects/spaceness/batch_scripts/tmp.srun

echo $command >> ~/projects/spaceness/batch_scripts/tmp.srun

sbatch ~/projects/spaceness/batch_scripts/tmp.srun
#
#command="python scripts/run_gwas.py \
# --infile $f \
# --outdir ~/projects/spaceness/gwas/out_random_snps \
# --plink_path ~/projects/plink-1.07-x86_64/plink \
# --vcftools_path ~/projects/vcftools_0.1.13/bin/vcftools \
# --nSamples 1000 \
# --sampling random \
# --mu 1e-8 \
# --phenotype random_snps \
# --phenotype_mean 100 \
# --phenotype_sd 10 \
# --gentimes ~/projects/spaceness/W50sp_gentimes.txt \
# --seed 12345"
# 
#cp ~/projects/spaceness/batch_scripts/slurm_gwas_header.srun ~/projects/spaceness/batch_scripts/tmp.srun
#
#echo $command >> ~/projects/spaceness/batch_scripts/tmp.srun
#
#sbatch ~/projects/spaceness/batch_scripts/tmp.srun
#
#
#command="python scripts/run_gwas.py \
# --infile $f \
# --outdir ~/projects/spaceness/gwas/out_one_snp \
# --plink_path ~/projects/plink-1.07-x86_64/plink \
# --vcftools_path ~/projects/vcftools_0.1.13/bin/vcftools \
# --nSamples 1000 \
# --sampling random \
# --mu 1e-8 \
# --phenotype one_snp \
# --phenotype_mean 100 \
# --phenotype_sd 10 \
# --gentimes ~/projects/spaceness/W50sp_gentimes.txt \
# --seed 12345"
# 
#cp ~/projects/spaceness/batch_scripts/slurm_gwas_header.srun ~/projects/spaceness/batch_scripts/tmp.srun
#
#echo $command >> ~/projects/spaceness/batch_scripts/tmp.srun
#
#sbatch ~/projects/spaceness/batch_scripts/tmp.srun
#
done
