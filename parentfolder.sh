#!/bin/bash

# Check if a file path is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <full-file-path>"
  exit 1
fi

# Get the full file path
file_path="$1"

# Extract the parent directory name
parent_folder=$(basename "$(dirname "$file_path")")

# Print the parent folder name
echo "Parent folder name: $parent_folder"
