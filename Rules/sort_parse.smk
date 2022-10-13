rule sort_parse:
    input:
        parsed = "tmp/{sample}.parsed.pairsam.gz",
        ref_fa=REF_FASTA
    output:
        sorted = "tmp/{sample}.parsed.sorted.pairsam.gz"
    threads: 16
    params:
        tmp=TEMP
    conda:
        "../Envs/pairtools.yaml"
    shell:
        "pairtools sort --nproc {threads} --tmpdir={params.tmp} {input.parsed} -o {output.sorted}"
