#!/bin/bash
# get the current script location
INSTALL_DIR=$(dirname -- "$(readlink -f "${BASH_SOURCE}")")

source $INSTALL_DIR/credentials.sh

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