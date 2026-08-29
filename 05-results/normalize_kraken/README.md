# Overview of the folder `normalize_kraken`

This folder contains all results generated in the NPost normalization tract.

### Metadata
- `dsvss_npost_w_rl_subsampling_metadata.tsv`: Read length stratification read length metadata and read counts, GC, and length both before and after processing

### Nonpareil
- `nonpareil`: Folder of Nonpareil output files

### Kraken2
- `dsvss_npost_kraken2_gtdb207_combined_table.tsv`: NPost Kraken2 output table before formatting
- `dsvss_npost_kraken2_output_file_names.tsv`: List of NPost Kraken2 output files
- `dsvss_npost_kraken2_gtdb207_total_species.tsv`: NPost Kraken2 output table formatted to include only species-level hits
- `dsvss_npost_kraken2_gtdb207_total_species_decontam.tsv`: Kraken2 total species for all samples (including read length stratification) after running Decontam
- `dsvss_npost_kraken2_gtdb207_total_species_decontam_filtered.tsv`: NPost Kraken2 decontaminated species-level hits post filtering to remove spurious hits (with read length stratification)
- `dsvss_npost_kraken2_gtdb207_total_species_decontam_filtered_no_rl.tsv`: NPost Kraken2 decontaminated species-level hits post filtering to remove spurious hits (no read length stratification)
- `dsvss_npost_kraken2_gtdb207_oral_species_decontam_filtered.tsv`: Kraken2 total species table filtered for only oral-associated taxa (no read length stratification)
- `dsvss_npost_kraken2_gtdb207_rl_oral_species_decontam_filtered.tsv`: Kraken2 total species table filtered for only oral-associated taxa (with read length stratification)

### SourceTracker
No read length stratification:
- `dsvss_npost_source_tracker_mappingfile_complete.tsv`: Source information per sample (required for SourceTracker input)
- `dsvss_npost_no_read_length_sourcetracker_input_mapping_file.tsv`: SourceTracker input mapping file with no read length subsampling
- `dsvss_npost_no_read_length_sourcetracker_input_decontam_species_table.txt`: SourceTracker input species table with no read length subsampling

Read length stratification:
- `dsvss_npost_over50bp_sourcetracker_input_mapping_file.tsv`: SourceTracker input mapping file for reads over and including 50 bp
- `dsvss_npost_over50bp_sourcetracker_input_decontam_species_table.txt`: SourceTracker input species table for reads over and including 50 bp
- `dsvss_npost_over50bp_sourcetracker_sink_predictions.txt`: NPost over 50 bp SourceTracker results
- `dsvss_npost_under50bp_sourcetracker_input_mapping_file.tsv`: SourceTracker input mapping file for reads less than 50 bp
- `dsvss_npost_under50bp_sourcetracker_input_decontam_species_table.txt`: SourceTracker input species table for reads less than 50 bp
- `dsvss_npost_under50bp_sourcetracker_sink_predictions.txt`: NPost under 50 bp SourceTracker results

### Classified Reads:
- `dsvss_npost_classified_read_length.tsv`: Read length of each classified NPost read
- `dsvss_npost_classified_gc.tsv`: GC content of each classified NPost read

### Oral Reads:
- `dsvss_npost_oral_read_length.tsv`: Read length of each oral NPost read
- `dsvss_npost_oral_gc.tsv`: GC content of each oral NPost read

### Species-specific read length distributions, GC distributions, and damage patterns (Figure 5)
- `dsvss_npost_oral_PCs_taxIDs.tsv`: Kraken2 taxIDs of the top 10 species driving variation on each PC in the well-preserved oral PCA (Figure 6A-B)
- `oral_well_preserved_PCs`: Folder including files with read length and GC content for reads attributed to species driving variation in the well-preserved oral species PCA; each library has a separate file
- `dsvss_npost_oral_pc_species_gc_categories.csv`: Species of interest and their GC content (averages based on reference genomes in NCBI)
- `mapDamge2`: folder containing all mapDamge output files (grouped by species)

### Duplication
- `duplication`: Folder containing duplicated reads for both total classified reads and oral reads
- `dsvss_norm_kraken_classified_merged_duplicated_reads.tsv`: Summary table showing how many unique classified merged reads are present at each level of duplication per library
- `dsvss_norm_kraken_classified_unmerged_duplicated_reads.tsv`: Summary table showing how many unique classified unmerged reads are present at each level of duplication per library
- `dsvss_norm_kraken_oral_merged_duplicated_reads.tsv`: Summary table showing how many unique oral merged reads are present at each level of duplication per library
- `dsvss_norm_kraken_oral_unmerged_duplicated_reads.tsv`: Summary table showing how many unique oral unmerged reads are present at each level of duplication per library
