#!/bin/bash

source ~/.bash_util.sh

##
# Note: The script requires:
#   git config --global push.default current
##

##
# @reference    How can I see which Git branches are tracking which remote / upstream branch?
#               https://stackoverflow.com/questions/4950725/how-can-i-see-which-git-branches-are-tracking-which-remote-upstream-branch
##
CURRENT_UPSTREAM=$(git rev-parse --abbrev-ref --symbolic-full-name @{upstream})

PATTERN="(master)|$GIT_PROTECTED_BRANCH_PATTERN"

##
# @reference    Bash test: what does “=~” do?
#               https://unix.stackexchange.com/questions/340440/bash-test-what-does-do
#
# @note The string, to be matched, should be quoted.
#       The regular expression pattern shouldn't be quoted.
##
if [[ "$CURRENT_UPSTREAM" =~ $PATTERN ]]; then
    Fatal "Push to $CURRENT_UPSTREAM is restricted."
else
    git push "$@"
fi
