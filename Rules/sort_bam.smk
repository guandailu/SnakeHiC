rule sort_bam:
    input:
        split = "tmp/{sample}.unsorted.bam"
    output:
        sorted = "05_mapped/{sample}.sorted.bam"
    threads: 8
    conda:
        "../Envs/samtools.yaml"
    shell:
        "samtools sort -@ {threads} -o {output.sorted} {input.split}; samtools index {output.sorted}"
