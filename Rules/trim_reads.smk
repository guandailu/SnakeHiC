rule trim_reads:
    input:
        R1 = "01_raw_fq/{sample}_R1.fq.gz",
        R2 = "01_raw_fq/{sample}_R2.fq.gz"
    output:
        R1 = "02_trimmed/{sample}_val_1.fq.gz",
        R2 = "02_trimmed/{sample}_val_2.fq.gz",
        RP1 = "02_trimmed/{sample}_R1.fq.gz_trimming_report.txt",
        RP2 = "02_trimmed/{sample}_R2.fq.gz_trimming_report.txt"
    threads: 16
    params:
        base = "{sample}",
        outdir = "02_trimmed"
    conda:
        "../Envs/trimgalore.yaml"
    shell:
        "trim_galore --paired --cores {threads} --basename {params.base} -o {params.outdir} --gzip {input.R1} {input.R2}"
