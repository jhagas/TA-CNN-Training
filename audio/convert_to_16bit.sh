#!/bin/bash

# sudo apt-get install sox
# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_folder output_folder"
    exit 1
fi

# Input and output folders
input_folder=$1
output_folder=$2

# Create the output folder if it doesn't exist
mkdir -p $output_folder

# Process each 8-bit audio file in the input folder
for input_file in "$input_folder"/*.wav; 
do
    # Extract the file name without the folder path
    file_name=$(basename "$input_file")

    # Define the output file path
    output_file="$output_folder/$file_name"

    # Convert 8-bit audio to 16-bit audio using sox
    sox "$input_file" -b 16 "$output_file"

    echo "Converted: $input_file -> $output_file"
done

echo "Conversion complete for all files in $input_folder"

