rule dedup_sam:
    input:
        sorted = "tmp/{sample}.parsed.sorted.pairsam.gz"
    output:
        dedup = "03_dedup/{sample}.dedup.pairsam.gz",
        stats = "03_dedup/{sample}.dedup.stats"
    threads: 8
    conda:
        "../Envs/pairtools.yaml"
    shell:
        "pairtools dedup --nproc-in {threads} --nproc-out {threads} --mark-dups --output-stats {output.stats} --output {output.dedup} {input.sorted}"

