rule call_tad:
    input:
        hic = "06_contact_map/{sample}.hic"
    output:
        tad = "09_called_TAD/{sample}.{res}/{res}_blocks.bedpe"  # directory("09_called_TAD/{sample}.{res}")
    threads: 16
    params:
        jucier=JUCIER,
        res="{res}",
        out_dir="09_called_TAD/{sample}.{res}"
    shell:
        "java -Xmx24G -Djava.awt.headless=true -jar {params.jucier} arrowhead --threads {threads} -k VC -r {params.res} {input.hic} {params.out_dir}"
