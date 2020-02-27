#! /bin/bash

if [ -z $1 ]; then
    BACKUP_DIR="/storage"
else
    BACKUP_DIR=$1
fi

set -eu

REPOS=$(curl -q -H "Authorization: token $GITHUB_TOKEN"  "https://api.github.com/$GITHUB_NAME/repos?per_page=200" | jq -r ".[].clone_url")

cd $BACKUP_DIR
for REPO_URL in $REPOS; do
    FOLDER=$(echo $REPO_URL | cut -d"/" -f5)
    if [ -d "$FOLDER" ]; then
        echo "Updating '$FOLDER'"
        (cd $FOLDER; git fetch --all)
    else
        echo "Cloning '$FOLDER'"
        git clone --mirror "https://$GITHUB_TOKEN@${REPO_URL:8}"
    fi
done


