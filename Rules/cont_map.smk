rule cont_map:
    input:
        pairs = "04_pairs/{sample}.pairs.gz",
        chrom_size = CHROM
    output:
        cont_map = "06_contact_map/{sample}.hic"
    threads: 30
    params:
        jucier=JUCIER
    shell:
        "java -Xmx240G -Djava.awt.headless=true -jar {params.jucier} pre -q 30 --threads {threads} {input.pairs} {output.cont_map} {input.chrom_size}"

