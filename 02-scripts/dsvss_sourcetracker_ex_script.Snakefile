################################################################################
# Run Sourcetracker with OTU table and mapping file
# EXAMPLE SCRIPT
# 
# Keri Burge
# modified from Irina Velsko
################################################################################

# Import necessary modules
from glob import glob
import os

# Define working directory
workdir: "<WORKING_DIRECTORY_PATH>"
outdir = "<OUTPUT_DIRECTORY_PATH>"


# Create a temporary directory if it does not exist
if not os.path.isdir("snakemake_tmp"):
    os.makedirs(f"{os.getcwd()}/snakemake_tmp")

# Define the rule all
rule all:
    input:
        expand("{outdir}/sourcetracker_output", outdir=outdir)
        
# Define rule
rule sourcetracker:
    output:
         directory("{outdir}/sourcetracker_output")
    params:
        rscript = "./02-scripts/sourcetracker_for_qiime.r",
        input_table = "./05-results/normalize_kraken/dsvss_npost_no_read_length_sourcetracker_input_decontam_species_table.txt", #EXAMPLE FILE
        mapping_file = "./05-results/normalize_kraken/dsvss_npost_no_read_length_sourcetracker_input_mapping_file.tsv", #EXAMPLE FILE
        outdir = outdir,
    shell:
        """
        Rscript {params.rscript} \
        -i {params.input_table} \
        -m {params.mapping_file} \
        -o {params.outdir}/sourcetracker_output \
        --train_rarefaction 3000  \
        -r 51500 \
        -v
        """