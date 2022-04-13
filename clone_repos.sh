#!/bin/bash
source credentials.sh

# retrieve all repositories from the current user in GitLab using apiv4
REPOS=$(curl -s -H "PRIVATE-TOKEN: $GITLAB_TOKEN" "https://$BASE_URL/api/v4/projects?" | jq -r '.[] | .path_with_namespace')

# clone all repos
for repo in $REPOS; do
    git clone https://$GITLAB_USER:$GITLAB_TOKEN@$BASE_URL/$repo.git
done