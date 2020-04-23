#!/bin/bash


##
# @reference    Use Git Grep to Replace Strings in Files in Your Git Repository
#               https://blog.jasonmeridth.com/posts/use-git-grep-to-replace-strings-in-files-in-your-git-repository/
##
if [ $# -eq 1 ]; then
    DIRECTORY=$(pwd)
elif [ $# -eq 2 ]; then
    DIRECTORY="$2"
else
    echo "Usage: $(basename $0) <sed_command> [<directory>]"
    echo " Example: git_sed.sh 's/status/balabala/g'"
    echo " Example: git_sed.sh 's/status/balabala/g scripts'"
    exit 1
fi


SEARCH_KEY=`echo "$1" | sed -n -E 's%^.*/(.*)/(.*)/.*$%\1%p'`
git grep --files-with-matches --null "$SEARCH_KEY" "$DIRECTORY" | xargs -0 sed -i "$1"
