rule call_loop:
    input:
        hic = "06_contact_map/{sample}.contact_map.hic"
    output:
        loop = "10_called_loop/{sample}.loop.txt"
    threads: 16
    shell:
        "/home/dguan/.local/bin/mustache -p {threads} -norm KR -f {input.hic} -r 5000 -pt 0.05 -o {output.loop}"
