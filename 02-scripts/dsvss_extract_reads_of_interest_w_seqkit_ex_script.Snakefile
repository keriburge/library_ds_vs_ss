################################################################################
# Use seqkit to extract reads of interest from fasta files 
# EXAMPLE SCRIPT
#
# Irina Velsko 
# Modified by Keri Burge 
################################################################################

from glob import glob
import os
import re

workdir: "<WORKING_DIRECTORY_PATH>"

#### SAMPLES ###################################################################
SAMPLES = {}
for sample in glob("<PATH_TO_FASTQ_FILES>/*.fastq.gz"):
	SAMPLES[os.path.basename(sample).split(".f")[0]] = sample
################################################################################

if not os.path.isdir("snakemake_tmp"):
    os.makedirs(f"{os.getcwd()}/snakemake_tmp")

rule all:
    input:
        expand("{sample}-<MODIFIER>.fastq", sample=SAMPLES.keys()) #modifier can be classified_reads, oral_reads, etc.

rule seqkit:
    output:
        "{sample}-<MODIFIER>.fastq"
    message: "Pull {wildcards.sample} <MODIFIER> into a new fasta file"
    params:
        infa = lambda wildcards: SAMPLES[wildcards.sample],
        contigs = "<PATH_TO_READ_HEADER_LISTS>/{sample}.kraken2.gtdb.output.<MODIFIER>.tsv" #list of read headers extracted with `dsvss_extract_reads_of_interest_w_seqkit_ex_script.Snakefile`
    threads: 8
    shell:
        """
        seqkit  grep -f {params.contigs} {params.infa} -o {output} -w 0
        """
