#!/bin/bash

# Generate a table with each unique read present in a library, 
# how many times it is observed in the dataset, and the length 
# of that read

input_dir="<PATH_TO_INPUT_FASTQ_FILES>"
output_dir="<PATH_TO_OUTPUT_DIRECTORY>"

#create output directory
mkdir -p "$output_dir"

#loop through each .fastq.gz file in the input directory
for file in "$input_dir"/*.fastq.gz; do

    #file basenames (LibraryIDs)
    base_name=$(basename "$file" ".fastq.gz") #modify if you have a additional info after the LibraryID

    #define temp files
    temp_seq_file=$(mktemp)
    temp_sorted_seq_file=$(mktemp)
    temp_sorted_counts_file=$(mktemp)
    temp_lengths_file=$(mktemp)
    temp_sorted_lengths_file=$(mktemp)
    temp_sorted_lengths_file=$(mktemp)
    temp_sorted_counts_file2=$(mktemp)
    temp_combined_file=$(mktemp)
    final_output="$output_dir/${base_name}_counts_with_lengths.txt"
    
    #extract sequences (line 2)
    zcat "$file" | awk 'NR % 4 == 2' > "$temp_seq_file"

    #sort sequences to run uniq
    sort "$temp_seq_file" > "$temp_sorted_seq_file"

    #count unique sequences
    uniq -c "$temp_sorted_seq_file" > "$temp_sorted_counts_file"

    #determine lengths of each seq
    zcat "$file" | awk 'NR % 4 == 2 { print length($0), $0 }' > "$temp_lengths_file"

    #sort lengths to match counts (so the files can be combined)
    sort -k2,2 "$temp_lengths_file" > "$temp_sorted_lengths_file"

    #sort counts to match lengths
    sort -k2,2 "$temp_sorted_counts_file" > "$temp_sorted_counts_file2"
    
    #combine counts and lengths
    awk 'NR==FNR { lengths[$2] = $1; next } { print $0, lengths[$2] }' "$temp_sorted_lengths_file" "$temp_sorted_counts_file2" > "$temp_combined_file"
   
    #sort highest count to lowest
    sort -nr -k1 "$temp_combined_file" > "$final_output"
   
    #remove the temp files
    rm "$temp_seq_file" "$temp_sorted_seq_file" "$temp_sorted_counts_file" "$temp_sorted_lengths_file" "$temp_combined_file"
    
    #finish!
    echo "Processed $file and saved results to $final_output"
done

