################################################################################
# Run cutadapt on dsLibs to remove adapters that persist after processing
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
for sample in glob("<PATH_TO_SAMTOOLS_OUTPUT>/*.unmapped.fastq.gz"):
	SAMPLES[os.path.basename(sample).split(".u")[0]] = sample
################################################################################


if not os.path.isdir("snakemake_tmp"):
    os.makedirs(f"{os.getcwd()}/snakemake_tmp")


rule all:
    input: 
        expand("cutadapt/{sample}.cutadapt.fastq.gz", sample=SAMPLES.keys())

rule cutadapt:
    output:
        output = "cutadapt/{sample}.cutadapt.fastq.gz"
    message: "Run {wildcards.sample} through cutadapt"
    params: 
    	infile=lambda wildcards: SAMPLES.get(wildcards.sample, None)
    conda: "./02-scripts/ENVS_cutadapt.yaml"
    threads: 4
    shell:
        """
        cutadapt {params.infile} \
        -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACATCTCGTATGCCGTCTTCTGCTTG \
        -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACNNNNNNNNATCTCGTATGCCGTCTTCTGCTTG \
        -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC \
        -g AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTTAGATCTCGGTGGTCGCCGTATCATT \
        -g AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTTNNNNNNNNGTGTAGATCTCGGTGGTCGCCGTATCATT \
        -g AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTT \
        -m 30 \
        -j 4 \
        -o {output}
        """
