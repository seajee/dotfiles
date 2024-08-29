#!/usr/bin/env bash

cd ./home/
files=$(find . -mindepth 1 -type f)
cd ..

readarray -t files_array <<< "$files"

for filepath in "${files_array[@]}"
do
    source_path="./home/$filepath"
    target_path="$HOME/$filepath"

    mkdir -p $(dirname "$target_path")

    if [ -f "$target_path" ]; then
        if ! cmp -s "$source_path" "$target_path"; then
            read -p "overwrite ${target_path}? [y/N] " input
            if [[ "$input" == [Yy]* ]]; then
                cp "$source_path" "$target_path"
            fi
        fi
    else
        cp "$source_path" "$target_path"
    fi
done

