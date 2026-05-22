#!/bin/bash

##
# @reference    Use Git Grep to Replace Strings in Files in Your Git Repository
#               https://blog.jasonmeridth.com/posts/use-git-grep-to-replace-strings-in-files-in-your-git-repository/
##
if [ $# -eq 0 ]; then
    echo "Usage: $(basename $0) <sed_command> [<directory>]"
    echo " Example: $(basename $0) 's/status/balabala/g'"
    echo " Example: $(basename $0) 's/status/balabala/g' scripts"
    exit 1
fi

DIRECTORY=${2:-$(pwd)}
SED_COMMAND="$1"

SEARCH_KEY=$(echo "$SED_COMMAND" | sed -n -E 's%^.*/(.*)/(.*)/.*$%\1%p')

set -x

git grep --files-with-matches --null -E "$SEARCH_KEY" "$DIRECTORY" | xargs -0 sed -i -E "$SED_COMMAND"
