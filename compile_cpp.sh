#!/bin/bash

#Check if the filename parameter is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <full_path_to_source_file.cpp>"
    exit 1
fi

#Get the full path of the source file
SOURCE_FILE="$1"
#Debugging: Print the full path of the source file
echo "Source file path: $SOURCE_FILE"

#Extract the parent directory name (folder name) from the full path
PARENT_DIR_NAME=$(basename "$(dirname "$SOURCE_FILE")")

#Debugging: Print the parent directory name
echo "Parent directory name: $PARENT_DIR_NAME"
# Extract the parent directory of the file
parent_folder=$(dirname "$SOURCE_FILE")
#Check if the source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: File '$SOURCE_FILE' not found."
    exit 2
fi

#Create a "debug" folder if it doesn't already exist
echo "Parent path: $parent_folder"
DEBUG_DIR="$parent_folder/debug"
if [ ! -d "$DEBUG_DIR" ]; then
    mkdir "$DEBUG_DIR"
fi

#Define the output executable name (based on the parent directory name)
EXEC_NAME="$DEBUG_DIR/$PARENT_DIR_NAME"

#Run clang++ to compile with debug mode and C++17 standard
clang++ -std=c++17 -ggdb -g -O0 "$SOURCE_FILE" -o "$EXEC_NAME" -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror

#Check if the compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful. Executable is named '$EXEC_NAME'."
else
    echo "Compilation failed."
    exit 3
fi
