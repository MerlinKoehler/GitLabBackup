#!/bin/bash
# A script that runs on each subdirectory of the current directory "git status".

# for each subdrectory of the current directory
for dir in *; do
    # if the directory is a git repository
    if [ -d "$dir/.git" ]; then
        echo "Git status in $dir:"

        # change to the directory
        cd $dir

        # run the git status command
        git status

        # change back to the parent directory
        cd ..
    fi
done