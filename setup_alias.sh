#!/bin/bash

alias file.remove='remove_files_in_directory() {
    if [ -z "$1" ]; then
        echo "Usage: file.remove <directory>"
        return 1
    fi

    if [ ! -d "$1" ]; then
        echo "Error: Directory $1 does not exist."
        return 1
    fi

    rm -f "$1"/*
    echo "All files in $1 have been removed."
}; remove_files_in_directory'