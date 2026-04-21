################################################################################
# Run Kraken2 with GTDB r207 database on ds v ss libraries
# Example Script
#
# Keri Burge
# Modified from Irina Velsko
################################################################################

from glob import glob
import os
import re

workdir: "<WORKING_DIRECTORY_PATH>"

#### SAMPLES ###################################################################
SAMPLES = {}
for sample in glob("<PATH_TO_INPUT_FASTQ_FILES>/*.gz"):
	SAMPLES[os.path.basename(sample).split(".fastq")[0]] = sample
################################################################################


if not os.path.isdir("snakemake_tmp"):
    os.makedirs(f"{os.getcwd()}/snakemake_tmp")


rule all:
    input: 
        expand("out/{sample}.kraken2.gtdb.output.tsv", sample=SAMPLES.keys()),
        expand("out/{sample}.kraken2.gtdb.report_mpa.tsv", sample=SAMPLES.keys())

rule kraken_classify:
    output:
        outfmt = "out/{sample}.kraken2.gtdb.output.tsv",
        repfmt = "out/{sample}.kraken2.gtdb.report_mpa.tsv"
    message: "Run {wildcards.sample} through kraken2 with database GTDB r207"
    params: 
        database = "<PATH_TO_struo2_GTDB_release207_DATABASE>",
        infile = lambda wildcards: SAMPLES[wildcards.sample],
    threads: 32
    conda: "./02-scripts/ENVS_Kraken2_Bracken.yaml"
    shell:
        """
        kraken2 --db {params.database} \
        {params.infile} \
        --threads {threads} \
        --output {output.outfmt} \
        --report {output.repfmt} \
        --report-zero-counts \
        --use-mpa-style \
        --use-names  \
        --confidence 0.15 \
        --gzip-compressed
        """


