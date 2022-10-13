rule get_qc:
    input:
        "03_dedup/{sample}.dedup.stats"
    output:
        "03_dedup/{sample}.stats.sum.txt"
    threads: 1
    conda:
        "../Envs/getqc.yaml"
    shell:
        "python3 /home/dguan/bin/MicroC/get_qc.py -p {input} > {output}"
