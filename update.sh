#!/usr/bin/env bash

cd ./home/
files=$(find . -mindepth 1 -type f)
cd ..

while IFS= read -r filepath; do
    eval cp "~/$filepath" "./home/$filepath"
done <<< "$files"
