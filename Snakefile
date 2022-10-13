from collections import defaultdict
import pandas as pd
import numpy as np
import os

configfile: "config.yaml"
workdir: config['workdir']
REF_FASTA = config["reffa"]
CHROM=config["chrom_size"]
TEMP = config["temp"]
JUCIER = config["jucier"]
RESOLUTIONS = config["resolutions"]
sample_file = config["sample_file"]
sample_df = pd.read_csv(sample_file, sep="\t", header=0)
SAMPLES=sample_df["LibraryID"].tolist()
FSAMPLES=np.unique(np.array(sample_df["SampleID"].tolist()))
sample = SAMPLES
res = RESOLUTIONS

rule all:
    input:
        REF_FASTA+'.bwt',
        expand("02_trimmed/{sample}_val_1.fq.gz",sample=SAMPLES),
        expand("02_trimmed/{sample}_val_2.fq.gz", sample=SAMPLES),
        expand("02_trimmed/{sample}_R1.fq.gz_trimming_report.txt", sample=SAMPLES),
        expand("02_trimmed/{sample}_R2.fq.gz_trimming_report.txt", sample=SAMPLES),
        expand("03_dedup/{sample}.dedup.stats", sample=SAMPLES),
        expand("03_dedup/{sample}.stats.sum.txt", sample=SAMPLES),
        expand("03_dedup/{sample}.dedup.pairsam.gz",sample=SAMPLES),
        expand("04_pairs/{sample}.pairs.gz", sample=FSAMPLES),
        expand("04_pairs/{sample}.pairs.gz.px2", sample=FSAMPLES),
        expand("05_mapped/{sample}.sorted.bam", sample=FSAMPLES),
        expand("05_mapped/{sample}.lc_extrap.txt", sample=FSAMPLES),
        expand("06_contact_map/{sample}.hic",sample=FSAMPLES),
        expand("07_cooler_map/{sample}.matrix.cool", sample=FSAMPLES),
        expand("07_cooler_map/{sample}.matrix.mcool", sample=FSAMPLES),
        expand("08_AB_compart/{sample}.ab", sample=FSAMPLES),
        expand("08_AB_compart/{sample}.AB.bed", sample=FSAMPLES),
        expand("09_called_TAD/{sample}.{res}/{res}_blocks.bedpe",sample=FSAMPLES, res = RESOLUTIONS),
        expand("10_called_loop/{sample}.loop.txt", sample=FSAMPLES),
        
genome_idx=REF_FASTA+'.bwt'
if not os.path.exists(genome_idx):
    include: "Rules/genome_idx.smk"
include: "Rules/trim_reads.smk"
include: "Rules/bwa.smk"
include: "Rules/parse_bam.smk"
include: "Rules/sort_parse.smk"
include: "Rules/dedup_sam.smk"
include: "Rules/get_qc.smk"

sample = FSAMPLES
def make_libs(wildcards):
    return expand("03_dedup/{libs}.dedup.pairsam.gz",libs=sample_df[sample_df["Sample"] == wildcards.sample]["SampleName"].to_list())

include: "Rules/merge_libs.smk"
include: "Rules/split_sam.smk"
include: "Rules/compress_pairs.smk"
include: "Rules/idx_pairix.smk"
include: "Rules/sort_bam.smk"
include: "Rules/lib_compx.smk"
include: "Rules/cont_map.smk"
include: "Rules/cooler_matrix.smk"
include: "Rules/mul_res_matrix.smk"
include: "Rules/AB_compart.yaml"
include: "Rules/call_tad.smk"
include: "Rules/call_loop.smk"

