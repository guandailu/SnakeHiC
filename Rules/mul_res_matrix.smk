rule mul_res_matrix:
    input:
        matrix = "07_cooler_map/{sample}.matrix.cool"
    output:
        mres = "07_cooler_map/{sample}.matrix.mcool"
    threads: 16
    conda:
        "../Envs/cooler.yaml"
    shell:
        "cooler zoomify --balance -p {threads} {input}"
