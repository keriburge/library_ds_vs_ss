# Overview of the folder `02-scripts`

This folder contains all the workflows and scripts that are necessary to conduct the experiments of this project.

### R scripts
Main Figures:
- `dsvss_figure1.Rmd`: R script used to generate the map panel in main text Figure 1 - Experimental design and library metadata
    - Additionally generates Supplemental Figure 1
- `dsvss_figure2.Rmd`: R script used to generate all figure panels in main text Figure 2 - Sequencing depth, dataset complexity, contamination profiles, and read retention, across library preparation protocols
- `dsvss_figure3.Rmd`: R script used to generate all figure panels in main text Figure 3 - Effect of library type on read processing after subsampling to 10 million reads (NPre)
    - Additionally generates Supplemental Figures 8-12
- `dsvss_figure4.Rmd`: R script used to generate all figure panels in main text Figure 4 - Oral-species specific read characteristics and taxonomic diversity of samples profiled with Kraken2 after subsampling to 5M reads
    - Additionally generates Supplemental Figures 23C and 24C
- `dsvss_figure5.Rmd`: R script used to generate all figure panels in main text Figure 5 - Oral species–specific drivers of PCA structure and library-dependent recovery of taxa

Supplemental Figures:
- `dsvss_npre_eager_gc_read_length_plots.Rmd`: R script to generate read length and GC distribution histograms for the NPre dataset throughout key *nf-core/eager* processing steps (adapter removal, read merging, low quality end trimming, removing reads less than 30bp, removing sequencing and lab artifacts (including reads mapped to the human genome and lab standards left in the sample), and additional adapter removal with Cutadapt)
    - Supplemental Figure 13
- `dsvss_decontam_sourcetracker_prep.Rmd`: Run decontam on Kraken2 outputs and prepare tables for Sourcetracker (NN, NPre, & NPost)
- `dsvss_NN_cuperdec_alpha_beta.Rmd`: R script to generate cuperdec curves and conduct alpha and beta diversity analyses on the NN dataset
    - Supplemental Figures 2, 3, 6A, 7A, 15A, 16A, 17A-B, 18A-B, 20, 23A, 24A, 25A-B
- `dsvss_npre_cuperdec_alpha_beta.Rmd`: R script to generate cuperdec curves and conduct alpha and beta diversity analyses on the NPre dataset
    - Supplemental Figures 4, 6B, 7B, 15B, 16B, 17C-D, 18C-D, 19, 23B, 24B, 25C-D, 26A-B, 27
- `dsvss_npost_cuperdec_alpha_beta.Rmd`: R script to generate cuperdec curves and conduct alpha and beta diversity analyses on the NPost dataset
    - Supplemental Figures 5, 6C, 7C, 18E-F, 21, 22, 26C-D, 28
- `dsvss_SI_fig14_classified_reads_NPost.Rmd`: R script to generate NPost classified read characteristics and taxonomic diversity
    - Supplemental Figures 14, 15C, 16C
- `dsvss_npost_species_specific_rl_damage.Rmd`: R script to generate NPost species-specific read length distributions, GC distributions, and damage plots (NN, NPre, & NPost)
    - Supplemental Figures 29-35
- `dsvss_duplication_plots.Rmd`: R script to generate all duplication plots for total classified reads and oral reads (NN, NPre, & NPost)
    - Supplemental Figures 36-37

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

Calculate GC/read length of specific reads (classified, oral, species specific, etc.):
- `dsvss_extract_classified_read_headers_of_interest_ex_script.sh`: Extract classified (or unclassified) Kraken2 read headers in order to later isolate just those reads with seqkit
- `dsvss_extract_oral_read_headers_ex_script.sh`: Extract Kraken2 reads attributed to oral species
- `dsvss_extract_reads_of_interest_w_seqkit_ex_script.Snakefile`: Use seqkit to extract reads of interest (classified reads, oral reads, etc.) using a list of read headers as the input
- `dsvss_calculate_gc_read_length_ex_script.Snakefile`: Calculate the GC content and fragment length of reads of interest

