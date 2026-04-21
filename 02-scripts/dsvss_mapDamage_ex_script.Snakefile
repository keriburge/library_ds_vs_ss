##########################################################################################
## Run mapDamage2 on reads mapped to a specific species 
## EXAMPLE SCRIPT
## 
##
## Keri Burge
##########################################################################################

from glob import glob
import os
import re

workdir: "<WORK_DIRECTORY_PATH>"

#### SAMPLES ###################################################################
SAMPLES = {}
for sample in glob("<PATH_TO_BAM_FILES>/*.bam"):
	SAMPLES[os.path.basename(sample).split(".b")[0]] = sample
################################################################################

if not os.path.isdir("snakemake_tmp"):
    os.makedirs(f"{os.getcwd()}/snakemake_tmp")


rule all:
    input: 
        expand("{sample}.<SPECIES_OF_INTEREST>_done.txt", sample=SAMPLES.keys())

rule damage:
    output:
        touch("{sample}.<SPECIES_OF_INTEREST>_done.txt")
    message: "Run {wildcards.sample} through mapDamge2"
    params: 
        bam = lambda wildcards: SAMPLES[wildcards.sample],
        ref = "<PATH_TO_REFERENCE_GENOME_FNA_FILE>"
    threads: 16
    conda: ".02-scripts/ENVS_mapDamage2.yaml"
    shell:
        """
        mapDamage -i {params.bam} -r {params.ref} 
        #use flag --single-stranded for ssLibs
        """