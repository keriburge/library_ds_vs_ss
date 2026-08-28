# Overview of the folder `05-results`

This folder contains all results generated in this project, including processed data and summary tables produced by the analysis workflows. These files are used for generating figures from scripts in `06-publication`

### Results for each normalization tract are included in separate folders:
- `no_normalization`: No normalization (NN)
- `normalize_eager`: Normalizing to 10 million read pairs prior to read processing (NPre)
- `normalize_kraken`: Normalizing to 5 million reads (merged pairs) post read processing (using NN data as the input) and prior to taxonomic identification (NPost)

### Control and source samples:
- `dsvss_controls_sourcetracker_metadata.tsv`: Control and source sample metadata
- `dsvss_sources_controls_kraken2_file_names.tsv`: List of control and source sample Kraken2 output files
- `dsvss_sources_control_kraken2_gtdb207_combined_table.tsv`: Kraken2 species table for control and source samples before formatting
- `dsvss_sources_controls_kraken2_gtdb207_total_species.tsv`: Kraken2 species table for control and source samples after formatting for only species-level hits

