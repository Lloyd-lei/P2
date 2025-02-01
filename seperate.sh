#!/bin/bash

# target file
target_dir="/electron_scattering_data"

# create even and odd directories
mkdir -p "$target_dir/odd" "$target_dir/even"

# iterate over all files in the target directory
for file in "$target_dir"/*; do
    # check if the file exists
    if [ -f "$file" ]; then
        # extract the index from the file name
        index=$(basename "$file" | grep -oP '(?<=_index_)\d+')

        # check if the index is even or odd
        if (( index % 2 == 0 )); then
            # even index, move to even directory
            mv "$file" "$target_dir/even/"
        else
            # odd index, move to odd directory
            mv "$file" "$target_dir/odd/"
        fi
    fi
done

echo "Files have been successfully separated into odd and even directories."