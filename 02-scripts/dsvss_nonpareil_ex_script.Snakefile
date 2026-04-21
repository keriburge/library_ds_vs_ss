################################################################################
# Run nonpareil on post-cutadapt fasta files
# EXAMPLE SCRIPT
#
# Keri Burge
################################################################################

from glob import glob
import os
import re

workdir: "<WORKING_DIRECTORY_PATH>"

#### SAMPLES ###################################################################
SAMPLES = {}
for sample in glob("<PATH_TO_POST_PROCESSING_FATSA_FILES>/fasta_files/*.fasta"):
	SAMPLES[os.path.basename(sample).split(".f")[0]] = sample
################################################################################


if not os.path.isdir("snakemake_tmp"):
    os.makedirs(f"{os.getcwd()}/snakemake_tmp")


#File suffixes Nonpareil will produce
NP_SUFFIXES = [".npa", ".npc", ".npl", ".npo"]

rule all:
    input:
    	expand("fasta_files/{sample}.cutadapt.fasta.gz", sample=SAMPLES.keys()),
        expand("out/{sample}{ext}", sample=SAMPLES.keys(), ext=NP_SUFFIXES)

rule nonpareil:
    output:
        npa="out/{sample}.npa",
        npc="out/{sample}.npc",
        npl="out/{sample}.npl",
        npo="out/{sample}.npo"
    message: "Running Nonpareil on {wildcards.sample}"
    params:
        infile=lambda wildcards: SAMPLES[wildcards.sample]
    conda: "./02-scripts/ENVS_nonpareil.yaml"
    threads: 16
    shell:
        """
        nonpareil -s {params.infile} \
                  -T alignment \
                  -f fasta \
                  -b out/{wildcards.sample}
        """

rule gzip_input:
    input:
        "fasta_files/{sample}.cutadapt.fasta",
        "out/{sample}.npo"  
    output:
        "fasta_files/{sample}.cutadapt.fasta.gz"
    shell:
        """
        gzip -f fasta_files/{wildcards.sample}.cutadapt.fasta
        """