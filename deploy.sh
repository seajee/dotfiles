#!/usr/bin/env bash

cd ./home/
files=$(find . -mindepth 1 -type f)
directories=$(find . -mindepth 1 -type d)
cd ..

while IFS= read -r directory; do
    mkdir -p "./testing/$directory"
done <<< "$directories"

readarray -t files_array <<< "$files"

for filepath in "${files_array[@]}"
do
    source_path="./home/$filepath"
    target_path="$HOME/$filepath"

    if [ -f "$target_path" ]; then
        if ! cmp -s "$source_path" "$target_path"; then
            # file=$(basename "$filepath")
            read -p "overwrite ${target_path}? [y/N] " input
            if [[ "$input" == [Yy]* ]]; then
                cp "$source_path" "$target_path"
            fi
        fi
    else
        cp "$source_path" "$target_path"
    fi
done

