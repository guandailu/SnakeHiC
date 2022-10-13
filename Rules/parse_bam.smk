rule parse_bam:
    input:
        aligned = "tmp/{sample}.aligned.bam",
        chrom_size=CHROM
    output:
        parsed = "tmp/{sample}.parsed.pairsam.gz"
    threads: 8
    conda:
        "../Envs/pairtools.yaml"
    shell:
        "pairtools parse --min-mapq 40 --walks-policy 5unique --max-inter-align-gap 30 --nproc-in {threads} --nproc-out {threads} --chroms-path {input.chrom_size} {input.aligned} -o {output.parsed}"
