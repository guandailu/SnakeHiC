rule lib_compx:
    input:
        "05_mapped/{sample}.sorted.bam"
    output:
        "05_mapped/{sample}.lc_extrap.txt"
    threads: 1
    conda:
        "../Envs/preseq.yaml"
    shell:
        "preseq lc_extrap -bam -pe -extrap 2.1e9 -step 1e8 -seg_len 1000000000 -output {output} {input}"
