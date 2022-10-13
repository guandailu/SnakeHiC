rule split_sam:
    input:
        dedup =rules.merge_libs.output
    output:
        unsorted = temp("tmp/{sample}.unsorted.bam"),
        pairs = "04_pairs/{sample}.pairs"
    threads: 8
    conda:
        "../Envs/pairtools.yaml"
    shell:
        "pairtools split --nproc-in {threads} --nproc-out {threads} --output-pairs {output.pairs} --output-sam {output.unsorted} {input.dedup}"

