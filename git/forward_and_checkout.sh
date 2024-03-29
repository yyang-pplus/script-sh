#!/bin/bash

source ~/.bash_util.sh

TRACKED_BRANCH="master"
NEW_BRANCH=""

if [ $# -eq 1 ]; then
    NEW_BRANCH=$1
elif [ $# -eq 2 ]; then
    TRACKED_BRANCH=$1
    NEW_BRANCH=$2
else
    echo "Usage: $(basename $0) [<tracked_branch>] <new_branch>"
    exit 1
fi

##
# @reference    Aborting a shell script if any command returns a non-zero value?
#               https://stackoverflow.com/questions/821396/aborting-a-shell-script-if-any-command-returns-a-non-zero-value
# @reference    How to echo shell commands as they are executed
#               https://stackoverflow.com/questions/2853803/how-to-echo-shell-commands-as-they-are-executed
##
set -ex

git checkout $TRACKED_BRANCH
git pull --rebase --ff-only --autostash

##
# @reference    Is there a better way to find out if a local git branch exists?
#               https://stackoverflow.com/questions/5167957/is-there-a-better-way-to-find-out-if-a-local-git-branch-exists
##
if git show-ref --verify --quiet "refs/heads/$NEW_BRANCH"; then
    git branch -D "$NEW_BRANCH"
fi
git checkout -b "$NEW_BRANCH"
