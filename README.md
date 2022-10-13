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

