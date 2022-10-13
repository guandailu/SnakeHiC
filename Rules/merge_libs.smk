rule merge_libs:
    input:
        make_libs
    output:
        temp("tmp/{sample}.dedup.pairsam.gz")
    threads: 8
    conda:
        "../Envs/pairtools.yaml"
    shell:
        "pairtools merge -o {output} --memory 64G --nproc-in {threads} --nproc-out {threads} {input}"
