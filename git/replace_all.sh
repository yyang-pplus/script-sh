#!/bin/bash

source ~/.bash_util.sh

set -x

##
# @reference    Use Git Grep to Replace Strings in Files in Your Git Repository
#               https://blog.jasonmeridth.com/posts/use-git-grep-to-replace-strings-in-files-in-your-git-repository/
##
if [ $# -eq 0 ]; then
    echo "Usage: $(basename $0) <sed_command> [<directory>]"
    echo " Example: git_sed.sh 's/status/balabala/g'"
    echo " Example: git_sed.sh 's/status/balabala/g scripts'"
    exit 1
fi

DIRECTORY=${2:-$(pwd)}
SED_COMMAND="$1"

SEARCH_KEY=$(echo "$SED_COMMAND" | sed -n -E 's%^.*/(.*)/(.*)/.*$%\1%p')

QuietRun pushd "$DIRECTORY"
git grep --files-with-matches --null -E "$SEARCH_KEY" . | xargs -0 sed -i -E "$SED_COMMAND"
QuietRun popd
