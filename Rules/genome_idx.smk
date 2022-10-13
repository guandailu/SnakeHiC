rule genome_idx:
    input:
        fa = REF_FASTA
    output:
        bwa_idx = genome_idx
    threads: 12
    conda:
        "../Envs/bwa.yaml"
    shell:
        "bwa index {input.fa}; samtools faidx {input.fa}"
