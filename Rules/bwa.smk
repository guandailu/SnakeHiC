rule bwa_mem:
    input:
        fq1 = "02_trimmed/{sample}_val_1.fq.gz",
        fq2 = "02_trimmed/{sample}_val_2.fq.gz",
        ref_fa=REF_FASTA,
        IDX=REF_FASTA+'.bwt'
    output:
        aligned = "tmp/{sample}.aligned.bam"
    threads: 12
    conda:
        "../Envs/bwa.yaml"
    shell:
        "bwa mem -5SP -T0 -t {threads} {input.ref_fa} {input.fq1} {input.fq2} | samtools view -bS - > {output.aligned}"
