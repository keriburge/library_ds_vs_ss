################################################################################
# Align reads against a species of interest to later use for mapDamage2
# EXAMPLE SCRIPT
# 
#
# Keri Burge 
################################################################################

from glob import glob
import os
import re

workdir: "<WORKING_DIRECTORY_PATH>"

#### SAMPLES ###################################################################
SAMPLES = {}
for sample in glob("<PATH_TO_FASTQ_FILES>/*.fastq.gz"):
	SAMPLES[os.path.basename(sample).split(".fastq")[0]] = sample
################################################################################

if not os.path.isdir("snakemake_tmp"):
    os.makedirs(f"{os.getcwd()}/snakemake_tmp")


rule all:
    input: 
        expand("{sample}.mapped_<SPECIES_OF_INTEREST>_q25l30_rmdup.bam.bai", sample=SAMPLES.keys())

rule bwa_aln:
    output:
        temp("{sample}.sai")
    message: "Align sample {wildcards.sample} against <SPECIES_OF_INTEREST> using BWA aln"
    params: 
        reffa = "<PATH_TO_REFERENCE_GENOME_FNA_FILE>",
        fastq = lambda wildcards: SAMPLES[wildcards.sample]
    conda: "./02-scripts/ENVS_samtools.yaml"
    threads: 4
    shell:
        """
        bwa aln -n 0.01 -o 2 -l 16500 -t {threads} \
            {params.reffa} \
            {params.fastq} > {output}
        """

rule bwa_samse:
    input:
        "{sample}.sai"
    output:
        temp("{sample}.sam")
    message: "Generate alignment file for sample {wildcards.sample} against <SPECIES_OF_INTEREST>"
    params:
        reffa = "<PATH_TO_REFERENCE_GENOME_FNA_FILE>",
        fastq = lambda wildcards: SAMPLES[wildcards.sample]
    conda: "./02-scripts/ENVS_samtools.yaml"
    threads: 4
    shell:
        """
        bwa samse \
            {params.reffa} \
            {input} \
            {params.fastq} > {output}
        """

rule sam2bam:
    input:
        "{sample}.sam"
    output:
        "{sample}.mapped_<SPECIES_OF_INTEREST>_q25l30.bam"
    message: "Convert to BAM and filter mapped reads: {wildcards.sample}"
   	conda: "./02-scripts/ENVS_samtools.yaml"
    threads: 4
    shell:
        """
        samtools view -Sb -q 25 -F 4 -e 'qlen >= 30' {input} | samtools sort -o {output}
        """


rule samtools_rmdup:
    input:
        "{sample}.mapped_<SPECIES_OF_INTEREST>_q25l30.bam"
    output:
        "{sample}.mapped_<SPECIES_OF_INTEREST>_q25l30_rmdup.bam"
    message: "Remove duplicate mapped reads for sample {wildcards.sample} against <SPECIES_OF_INTEREST>"
    conda: "./02-scripts/ENVS_samtools.yaml"
    params:
    shell:
        """
        samtools rmdup -s {input} {output}
        """

rule samtools_index:
    input:
        "{sample}.mapped_<SPECIES_OF_INTEREST>_q25l30_rmdup.bam"
    output:
        "{sample}.mapped_<SPECIES_OF_INTEREST>_q25l30_rmdup.bam.bai"
    message: "Index bam file for sample {wildcards.sample} mapped against <SPECIES_OF_INTEREST>"
    conda: "./02-scripts/ENVS_samtools.yaml"
    params:
    threads: 4
    shell:
        """
        samtools index {input}
        """
