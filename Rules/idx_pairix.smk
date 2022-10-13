rule idx_pairix:
    input:
        pairs = "04_pairs/{sample}.pairs.gz",
    output:
        idx = "04_pairs/{sample}.pairs.gz.px2"
    threads: 1
    conda:
        "../Envs/pairix.yaml"
    shell:
        "pairix {input}"
