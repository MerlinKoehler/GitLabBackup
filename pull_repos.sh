#!/bin/bash
source credentials.sh

# change to the backup directory
cd $GITLAB_BACKUP_DIR

for dir in *; do
    if [ -d "$dir" ]; then
        cd "$dir"
        # Run git pull and store the output in a local variable
        output=$(git pull)
        echo "$output"
        cd ..
    fi
done