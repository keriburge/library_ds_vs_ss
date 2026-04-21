################################################################################
# Calculate the GC content and read length of reads of interest
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
for sample in glob("<PATH_TO_READS_OF_INTEREST>/*.fastq"):
	SAMPLES[os.path.basename(sample).split("-")[0]] = sample
################################################################################

if not os.path.isdir("snakemake_tmp"):
    os.makedirs(f"{os.getcwd()}/snakemake_tmp")


rule all:
    input: 
        expand("{sample}.<MODIFIER>_gc_rl.tsv.gz", sample=SAMPLES.keys()) #modifier can be "oral", "classified", etc.

rule gc_rl:
    output:
        "{sample}.<MODIFIER>_gc_rl.tsv.gz"
    message: "Run emboss infoseq on {wildcards.sample}"
    group: "infoseq"
    params: 
        fasta = lambda wildcards: SAMPLES[wildcards.sample]
    shell:
        """
        infoseq -auto -outfile {wildcards.sample}.<MODIFIER>_gc_rl.tsv -only -name -length -pgc {params.fasta}
        pigz -p 8 {wildcards.sample}.<MODIFIER>_gc_rl.tsv
        pigz -p 8 <PATH_TO_INPUT_READS_TO_GZIP>/{wildcards.sample}.<MODIFIER>.fastq
        """
        