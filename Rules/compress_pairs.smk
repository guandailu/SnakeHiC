rule compress_pairs:
    input:
        pairs = "04_pairs/{sample}.pairs",
    output:
        pairs_gz = "04_pairs/{sample}.pairs.gz",
    threads: 16
    conda:
        "../Envs/bgzip.yaml"
    shell:
        "bgzip -f -l -c {input.pairs} > {output.pairs_gz}"
