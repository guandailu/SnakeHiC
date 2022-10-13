rule compart_plot:
    input:
        ab = "08_AB_compart/{sample}.ab",
        bed = "08_AB_compart/{sample}.AB_compart.bed"
    output:
        plot="08_AB_compart/{sample}.ab.chr5.pdf"
    threads: 1
    shell:
        "/home/dguan/.local/bin/fancplot -o {output.plot} 5 -p square {input.ab} -p line {input.bed}"
