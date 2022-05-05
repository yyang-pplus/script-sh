#!/bin/bash

source ~/.bash_util.sh

set -e

if [ $# -eq 1 ]; then
    SSH_CONNECTION_STR=$1
else
    echo "Usage: $(basename $0) <host>"
    exit 1
fi

PROJECT_ROOT_DIR=$(git rev-parse --show-toplevel)
BASE_DIR=${PROJECT_ROOT_DIR#*$HOME/}

##
# @reference    Git: list only "untracked" files (also, custom commands)
#               https://stackoverflow.com/questions/3801321/git-list-only-untracked-files-also-custom-commands
##
QuietRun pushd "$PROJECT_ROOT_DIR"
CHANGED_FILES=($(git ls-files --modified --others --exclude-standard))

for a_file in "${CHANGED_FILES[@]}"; do
    scp $a_file $SSH_CONNECTION_STR:~/$BASE_DIR/$a_file
done
QuietRun popd
