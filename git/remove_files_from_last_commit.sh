#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $(basename $0) [--] <paths>..."
    exit 1
fi

##
# @reference    Remove files from Git commit
#               https://stackoverflow.com/questions/12481639/remove-files-from-git-commit
##
git reset --soft HEAD^
git reset HEAD "$@"
git commit --reuse-message ORIG_HEAD
