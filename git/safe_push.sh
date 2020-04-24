#!/bin/bash

##
# Note: The script requires:
#   git config --global push.default current
##


source ~/.bash_util.sh

THIS_DIR=$(dirname "$0")
source $THIS_DIR/util.sh


##
# @reference    How can I see which Git branches are tracking which remote / upstream branch?
#               https://stackoverflow.com/questions/4950725/how-can-i-see-which-git-branches-are-tracking-which-remote-upstream-branch
##
CURRENT_UPSTREAM=$(git rev-parse --abbrev-ref --symbolic-full-name @{upstream})

if ! IsProtected "$CURRENT_UPSTREAM"; then
    git push "$@"
fi
