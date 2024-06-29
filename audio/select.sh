#!/bin/bash

# Directory containing the files (change this to your target directory)
SOURCE_DIRECTORIES=("Mic 1" "Mic 2" "Mic 3")

# Directory to copy the files to (change this to your target directory)
DESTINATION_DIRECTORY="./Selected"

# Number of files to select
NUM_FILES=84

# Create the destination directory if it doesn't exist
mkdir -p "$DESTINATION_DIRECTORY"

# Find all files, shuffle them, select the first 84, and copy them to the destination directory
for SOURCE_DIRECTORY in "${SOURCE_DIRECTORIES[@]}"; do
  # Find all files, shuffle them, select the first 84, and copy them to the destination directory
  find "$SOURCE_DIRECTORY" -type f | shuf | head -n $NUM_FILES | while read FILE; do
    cp "$FILE" "$DESTINATION_DIRECTORY"
  done
done
