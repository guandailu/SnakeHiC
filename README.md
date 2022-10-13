# SnakeHiC
A snakemake-based pipeline for processing HiC data.

This is a work-in-progress. Documentation is currently very brief and minimal. 

Currently, the pipeline only supports High Performance Computing (HPC) platform.

## Setting up pipeline
```bash
git clone git@github.com:FarmOmics/SnakeHiC.git
```

## Setting up data
Raw paired-end fastq files should be put in a directory with name of "01_raw_fq". In file "sample.list"
Create a directory that will be the working directory for the pipeline. You will move your raw data into this folder, and the pipeline will populate it with many other folders containing results, analyses, etc.
