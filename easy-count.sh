#!/bin/bash
# Author: Abdallah Ali
# Date: Dec-2024

# Description:
# This script calculates the number of lines, words, and characters in a given text.
# It can process content from a file or from the clipboard if no file is specified.

# Usage:
# - To process content from a file, provide the file name as an argument:
#   ./text_stats.sh filename.txt
# - To process content from the clipboard, run the script without any arguments:
#   ./text_stats.sh

# Function to print a colored table row
print_table_row() {
    local header=$1
    local value=$2
    local color=$3
    echo -e "${color}${header}\t${value}\033[0m"
}

# Function to calculate statistics
calculate_stats() {
    local content="$1"
    local lines=$(echo "$content" | wc -l)
    local words=$(echo "$content" | wc -w)
    local characters=$(echo "$content" | wc -m)

    echo -e "\033[1mStatistics:\033[0m"
    print_table_row "Number of lines:" "$lines" "\033[34m"
    print_table_row "Number of words:" "$words" "\033[32m"
    print_table_row "Number of characters:" "$characters" "\033[33m"
}

# Check if xclip or xsel is installed
check_dependencies() {
    if ! command -v xclip &> /dev/null && ! command -v xsel &> /dev/null; then
        echo "Neither xclip nor xsel is installed. Please install one of them."
        echo "You can install xclip using: sudo apt-get install xclip"
        echo "Or you can install xsel using: sudo apt-get install xsel"
        exit 1
    fi
}

# Check if there is an argument
if [ -n "$1" ]; then
    # Check if the file exists
    if [ -f "$1" ]; then
        # Read content from the file
        content=$(cat "$1")
        calculate_stats "$content"
    else
        echo "File not found: $1"
        exit 1
    fi
else
    # Check dependencies
    check_dependencies

    # Read clipboard content using xclip or xsel
    if command -v xclip &> /dev/null; then
        content=$(xclip -selection clipboard -o)
    elif command -v xsel &> /dev/null; then
        content=$(xsel --clipboard --output)
    fi

    if [ -z "$content" ]; then
        echo "Clipboard or File is empty"
        exit 1
    fi
    calculate_stats "$content"
fi
