# Overview of the folder `02-scripts`

This folder contains all the workflows and scripts that are necessary to conduct the experiments of this project.

### R scripts
- `dsvss_figure1.Rmd`: R script used to generate the map panel in main text figure 1
- `dsvss_figure2.Rmd`: R script used to generate all figure panels in main text figure 2
- `dsvss_figure3.Rmd`: R script used to generate all figure panels in main text figure 3
- `dsvss_figure4.Rmd`: R script used to generate all figure panels in main text figure 4
- `dsvss_figure5.Rmd`: R script used to generate all figure panels in main text figure 5
- `dsvss_figure6.Rmd`: R script used to generate all figure panels in main text figure 6
- `dsvss_duplication_plots.Rmd`: R script to generate all duplication plots for total classified reads and oral reads (SI figures XX6, XX7) (NN, NPre, & NPost)
- `dsvss_decontam_sourcetracker_prep.Rmd`: Run decontam on Kraken2 outputs and prepare tables for Sourcetracker (NN, NPre, & NPost)
- `dsvss_npost_species_specific_rl_damage.Rmd`: R script to generate NPost species-specific read length distributions, GC distributions, and damage plots
- `dsvss_NN_cuperdec_alpha_beta.Rmd`: R script to generate cuperdec curves and conduct alpha and beta diversity analyses on the NN dataset
- `dsvss_npre_cuperdec_alpha_beta.Rmd`: R script to generate cuperdec curves and conduct alpha and beta diversity analyses on the NPre dataset
- `dsvss_npre_eager_gc_read_length_plots.Rmd`: R script to generate read length and GC distribution histograms for the NPre dataset throughout key *nf-core/eager* processing steps (adapter removal, read merging, low quality end trimming, removing reads less than 30bp, removing sequencing and lab artifacts (including reads mapped to the human genome and lab standards left in the sample), and additional adapter removal with Cutadapt)
- `dsvss_npost_cuperdec_alpha_beta.Rmd`: R script to generate cuperdec curves and conduct alpha and beta diversity analyses on the NPost dataset

### The files starting with the prefix `ENVS` are conda environments used in combination with Snakemake.
- `ENVS_cutadapt.yaml`: Cutadapt conda environment
- `ENVS_Kraken2_Bracken.yaml`: Kraken2 conda environment
- `ENVS_mapDamage2.yaml`: mapDamge2 conda environment
- `ENVS_samtools.yaml`: Samtools conda environment
- `ENVS_nonpareil.yaml`: Nonpareil conda environment

### Example scripts (modified for each normalization tract)
- `dsvss_cutadapt_dsLibs_ex_script.Snakefile`: Run Cutadapt on dsLibs
- `dsvss_cutadapt_ssLibs_ex_script.Snakefile`: Run Cutadapt on ssLibs
- `dsvss_nonpareil_ex_script.Snakefile`: Run Nonpareil on post-cutadapt fasta files
- `dsvss_kraken2_gtdb207_ex_script.Snakefile`: Run Kraken2 with the GTDB r207 database
- `dsvss_sourcetracker_ex_script.Snakefile`: Run Sourcetracker with OTU table and mapping file
- `dsvss_species_mapping_ex_script.Snakefile`: Map reads to species of interest (used for mapDamage input)
- `dsvss_mapDamage_ex_script.Snakefile`: Generate damage profiles using mapDamage on reads mapped to specific species
- `dsvss_duplication_ex_script.sh`: Generate a table of unique reads per library and how many times those exact reads are present in the library to quantify clonality 
Calculate GC/read length of specific reads (classified, oral, species specific, etc.)
- `dsvss_extract_classified_read_headers_of_interest_ex_script.sh`: Extract classified (or unclassified) Kraken2 read headers in order to later isolate just those reads with seqkit
- `dsvss_extract_oral_read_headers_ex_script.sh`: Extract Kraken2 reads attributed to oral species
- `dsvss_extract_reads_of_interest_w_seqkit_ex_script.Snakefile`: Use seqkit to extract reads of interest (classified reads, oral reads, etc.) using a list of read headers as the input
- `dsvss_calculate_gc_read_length_ex_script.Snakefile`: Calculate the GC content and fragment length of reads of interest

