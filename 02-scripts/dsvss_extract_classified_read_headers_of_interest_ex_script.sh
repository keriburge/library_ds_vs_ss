#!/bin/bash
#Generate a list of classified (or unclassified) Kraken2 read headers

for f in <PATH_TO_KRAKEN2_OUTPUT_FILES>/*.kraken2.gtdb.output.tsv
do
grep "^C" $f | awk -F"\t" '{print $2}' > <PATH_TO_OUTPUT_DIRECTORY>/classified_reads_list/$(basename $f .tsv).classified.tsv
#for unclassified reads, run: grep "^U" $f | awk -F"\t" '{print $2}' > <PATH_TO_OUTPUT_DIRECTORY>/unclassified_reads_list/$(basename $f .tsv).unclassified.tsv
done
