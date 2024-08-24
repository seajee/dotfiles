#!/usr/bin/env bash

cd ./home/
directories=$(find . -mindepth 1 -type d)
files=$(find . -mindepth 1 -type f)
cd ..

while IFS= read -r directory; do
    mkdir -p "./home/$directory"
done <<< "$directories"

while IFS= read -r filepath; do
    eval cp "~/$filepath" "./home/$filepath"
done <<< "$files"
