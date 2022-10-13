#!/bin/bash -l

module load snakemake/5.32.2
source activate snakemake-5.32.2

mkdir -p Logs
snakemake -j 30  \
    --cluster-config cluster.yaml --rerun-incomplete \
    --cluster "sbatch -p {cluster.partition} -t {cluster.time} -N {cluster.nodes} -c {cluster.cpus} --mem={cluster.mem} -J {cluster.name} -o {cluster.output} -e {cluster.output}" \
    -s Snakefile --configfile config.yaml --nolock --latency-wait 120 -p -k --use-conda $@
