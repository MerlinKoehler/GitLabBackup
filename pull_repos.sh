#!/bin/bash

for dir in *; do
    if [ -d "$dir" ]; then
        cd "$dir"
        # Run git pull and store the output in a local variable
        output=$(git pull)
        echo "$output"
        cd ..
    fi
done