# Overview of the folder `normalize_eager`

This folder contains all results generated in the NPre normalization tract.

### Metadata
- `dsvss_npre_metadata.tsv`: Sample metadata and read counts, GC, and length both before and after processing
- `dsvss_npre_w_rl_subsampling_metadata.tsv`: Read length stratification sample metadata and read counts, GC, and length both before and after processing

### Kraken2
- `dsvss_npre_eager_read_counts.tsv`: Read counts throughout processing steps
- `dsvss_npre_kraken2_gtdb207_combined_table.tsv`: NPre Kraken2 output table before formatting
- `dsvss_npre_kraken2_output_file_names.tsv`: List of NPre Kraken2 output files
- `dsvss_npre_kraken2_gtdb207_total_species.tsv`: NPre Kraken2 output table formatted to include only species-level hits
- `dsvss_npre_read_length_subsample_kraken2_gtdb207_combined_table.tsv`: NPre with read length stratification Kraken2 output table before formatting
- `dsvss_npre_read_length_subsampling_kraken2_output_file_names.tsv`: List of NPre read length stratification Kraken2 output files
- `dsvss_npre_read_length_subsampling_kraken2_gtdb207_total_species.tsv`: NPre with read length stratification Kraken2 output table formatted to include only species-level hits
- `dsvss_npre_w_read_length_kraken2_gtdb207_total_species_decontam.tsv`: Kraken2 total species for all samples (including read length stratification) after running decontam
- `dsvss_npre_no_rl_kraken2_gtdb207_oral_species_decontam_filtered.tsv`: Kraken2 oral species table after running decontam and filtering for low abundance species

### Read length and GC distributions during processing steps
- `dsvss_npre_read_length_adapter_removal.tsv`: Read length distributions of reads post adapter removal
- `dsvss_npre_read_length_remove30bp.tsv`: Read length distributions of reads after removing reads <30 bp
- `dsvss_npre_read_length_artifact_removal.tsv`: Read length distributions of reads after removing laboratory and sequencing artifacts
- `dsvss_npre_read_length_cutadapt.tsv`: Read length distributions of reads after running Cutadapt to remove persisting adapter sequences
- `dsvss_npre_gc_adapter_removal.tsv`: GC content distributions of reads after adapter removal
- `dsvss_npre_gc_remove30bp.tsv`: GC content distributions of reads after removing reads <30 bp
- `dsvss_npre_gc_artifact_removal.tsv`: GC content distributions of reads after removing laboratory and sequencing artifacts
- `dsvss_npre_gc_cutadapt.tsv`: GC content distributions of reads after running Cutadapt to remove persisting adapter sequences
- `dsvss_npre_gc_content_before_processing.tsv`: GC content distributions of reads before processing via nf-core/eager

### SourceTracker
- `dsvss_npre_source_tracker_mappingfile_complete.tsv`: Source information per sample (required for SourceTracker input)
- `dsvss_npre_no_read_length_sourcetracker_input_mapping_file.tsv`: SourceTracker input mapping file with no read length subsampling
- `dsvss_npost_no_read_length_sourcetracker_input_decontam_species_table.txt`: Sourcetracker input species table with no read length subsampling
- `dsvss_npre_over50bp_sourcetracker_input_mapping_file.tsv`: SourceTracker input mapping file for reads over and including 50 bp
- `dsvss_npre_over50bp_sourcetracker_input_decontam_species_table.txt`: Sourcetracker input species table for reads over and including 50 bp
- `dsvss_npre_under50bp_sourcetracker_input_mapping_file.tsv`: SourceTracker input mapping file for reads less than 50 bp
- `dsvss_npre_under50bp_sourcetracker_input_decontam_species_table.txt`: Sourcetracker input species table for reads less than 50 bp
- `dsvss_npre_sourcetracker_sink_predictions.txt`: NPre sourcetracker results (no read length stratification)

### Duplication
- `dsvss_norm_eager_classified_merged_duplicated_reads.tsv`: Summary table showing how many unique classified merged reads are present at each level of duplication per library
- `dsvss_norm_eager_classified_unmerged_duplicated_reads.tsv`: Summary table showing how many unique classified unmerged reads are present at each level of duplication per library
- `dsvss_norm_eager_oral_merged_duplicated_reads.tsv`: Summary table showing how many unique oral merged reads are present at each level of duplication per library
- `dsvss_norm_eager_oral_unmerged_duplicated_reads.tsv`: Summary table showing how many unique oral unmerged reads are present at each level of duplication per library
- `duplication`: Folder containing duplicated reads for both total classified reads and oral reads 

### Nonpareil
- `npre_nonpareil_npo_file_paths.tsv`: Paths to nonpareil output files
- `nonpareil`: Folder of Nonpareil results
