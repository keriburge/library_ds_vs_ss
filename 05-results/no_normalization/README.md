# Overview of the folder `no_normalization`

This folder contains all results generated in the NN normalization tract.

### Metadata
- `dsvss_no_normalization_metadata.tsv`: Sample metadata and read counts, GC, and length both before and after processing

### Nonpareil
- `nonpareil`: Folder containing Nonpareil .npo output files
- `NN_nonpareil_npo_file_paths.tsv`: Output .npo file paths needed for plot generation

### Kraken2
- `dsvss_NN_kraken2_gtdb207_combined_table.tsv`: No normalization Kraken2 output table before formatting
- `dsvss_NN_kraken2_output_file_names.tsv`: List of no normalization Kraken2 output files 
- `dsvss_NN_kraken2_gtdb207_total_species.tsv`: No normalization Kraken2 output table formatted to include only species-level hits
- `dsvss_NN_kraken2_gtdb207_total_species_decontam.tsv`: No normalization Kraken2 output table formatted to include only species-level hits and decontaminated (via Decontam)
- `dsvss_NN_kraken2_gtdb207_total_species_decontam_filtered.tsv`: No normalization Kraken2 decontaminated species-level hits post filtering to remove spurious hits  
- `dsvss_NN_kraken2_gtdb207_oral_species_decontam_filtered.tsv`:  No normalization Kraken2 oral species table (post decontamination and filtering)

### SourceTracker
- `dsvss_NN_source_tracker_mappingfile_complete.tsv`: Source information per sample (required for SourceTracker input)
- `dsvss_NN_sourcetracker_input_decontam_species_table.txt`: SourceTracker input species table
- `dsvss_NN_sourcetracker_sink_predictions.txt`: No noramlization SourceTracker output

### Classified Reads
- `dsvss_NN_classified_read_length.tsv`: No normalization classified reads length distribution
- `dsvss_NN_classified_gc.tsv`: No normalization classified reads GC content distribution

### Oral Reads
- `dsvss_NN_oral_read_length.tsv`: No normalization oral reads length distribution
- `dsvss_NN_oral_gc.tsv`: No normalization oral reads GC content distribution

### Duplication
- `duplication`: Folder containing duplicated reads for both total classified reads and oral reads
- `dsvss_no_norm_classified_merged_duplicated_reads.tsv`: Summary table showing how many unique classified merged reads are present at each level of duplication per library
- `dsvss_no_norm_classified_unmerged_duplicated_reads.tsv`: Summary table showing how many unique classified unmerged reads are present at each level of duplication per library
- `dsvss_no_norm_oral_merged_duplicated_reads.tsv`: Summary table showing how many unique oral merged reads are present at each level of duplication per library
- `dsvss_no_norm_oral_unmerged_duplicated_reads.tsv.tsv`: Summary table showing how many unique oral unmerged reads are present at each level of duplication per library
