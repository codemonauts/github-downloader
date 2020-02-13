# github-downloader

This tool will clone all private and public repositories from a user or from a organisation, so you have a backup if GitHub goes offline someday.

## Github Token
Go to your [Github Settings](https://github.com/settings/tokens) and create a
new token with the permissions "read:org, repo"

## Standalone usage
```
export GITHUB_TOKEN=<github-token>
export GITHUB_NAME="users/fleaz"
./download.sh /path/to/backupfolder
```

## Usage with Docker
```
docker run --rm -v /path/to/backupfolder:/storage -e GITHUB_TOKEN=<secret-github-token> -e GITHUB_NAME="orgs/codemonauts" codemonauts/github-downloader
```
