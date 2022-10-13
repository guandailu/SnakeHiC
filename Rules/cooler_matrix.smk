rule cooler_matrix:
    input:
        pairs = "04_pairs/{sample}.pairs.gz",
        ref_fa = CHROM
    output:
        matrix = "07_cooler_map/{sample}.matrix.cool"
    threads: 16
    conda:
        "../Envs/cooler.yaml"
    shell:
        "cooler cload pairix -p {threads} {input.ref_fa}:5000 {input.pairs} {output.matrix}"

