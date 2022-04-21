#!/bin/bash

# Import SENDER and RECEPIENT from credentials.sh.
source credentials.sh

# change to the backup directory
cd $GITLAB_BACKUP_DIR

# Set mail subject.
DATE=$(date +%Y-%m-%d)
SUBJECT="Backup of repositories on $date"

# Initialize mail body.
MESSAGE=""


# For each repository in the current directory, pull the repository.
for dir in *; do
    if [ -d "$dir" ]; then
        cd "$dir"
        # Run git pull and store the output in a local variable
        output=$(git pull)
        echo "$output"
        
        # If the repository is not already up to date, add the output to the mail body:
        if [[ $output != *"Already up to date."* ]]; then
            # add the output to the message
            MESSAGE="$MESSAGE\n\nChanges in $dir:\n$output"
        fi
        cd ..
    fi
done

TIME=$(date +%H:%M)

# If message is empty string:
if [ -z "$MESSAGE" ]; then
    MESSAGE="No changes in the repositories."
fi

MESSAGE="$MESSAGE\n\nBackup completed: $DATE $TIME"

echo -e "$MESSAGE" | mailx -r "$SENDER" -s "$SUBJECT" "$RECIPIENT"
