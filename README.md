# SnakeHiC
A snakemake-based pipeline for processing HiC data.

This is a work-in-progress. Documentation is currently very brief and minimal. 

Currently, the pipeline only supports High Performance Computing (HPC) platform.

## Setting up pipeline
```bash
git clone git@github.com:FarmOmics/SnakeHiC.git

cd SnakeHiC
```

## Setting up data
Raw paired-end fastq files should be put in a directory with name of "01_raw_fq". In the "sample.txt", your sample information should be provided, including two coloumns: LibraryID and SampleID. If your each sample only has one library, two coloumns will be same. Raw paired-end fastq files should be named as ```LibraryID_R1.fq.gz``` and ```LibraryID_R2.fq.gz```

## Preparing configuration file
The configuration file "config.yaml" should be changed according to your setting.
```
workdir: SnakeHiC ### working directory, usually current dorectory, absolute path is better
reffa: Gallus_gallus.bGalGal1.mat.broiler.GRCg7b.dna_sm.toplevel.chr.fa   ### reference genome fasta file
chrom_size: Gallus_gallus.bGalGal1.mat.broiler.GRCg7b.dna_sm.toplevel.chr.fa.genome   ### a file containing chromosome size, including two coloumns (chromosome, its size)
temp: tmp ## temporary directory
sample_file: sample.txt  ## /path/to/sample.txt, usually in current dorectory
jucier: juicer_1.22.01.jar  ## juicer should be separaley downloaded and provide full path here
resolutions: ["500", "1000", "5000", "10000", "25000", "50000", "100000", "250000", "500000", "1000000"] ### resolutions you want to include in generated ".hic" file
```
