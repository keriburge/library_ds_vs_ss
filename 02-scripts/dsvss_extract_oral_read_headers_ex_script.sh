#!/bin/bash
#Generate a list of read headers assigned to oral taxa

#set output and working directory paths
output_dir="<PATH_TO_OUTPUT_DIRECTORY"
taxid_file="./00-documentation/dsvss_oral_kraken2_taxIDS.tsv"

for f in <PATH_TO_KRAKEN2_OUTPUT_FILES>/*.kraken2.gtdb.output.tsv; do
    outfile="$output_dir/$(basename "$f" .tsv).oral.tsv"

    #use awk to filter based on taxID file
    awk -F"\t" '
    BEGIN {
        while ((getline line < "'$taxid_file'") > 0) {
            taxid_map[line] = 1;
        }
        close("'$taxid_file'")
    }
    $1 == "C" {
        if (match($0, /\(taxid ([0-9]+)\)/, m)) {
            if (m[1] in taxid_map) {
                print $2; 
            }
        }
    }' "$f" > "$outfile"
done