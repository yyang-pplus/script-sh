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

LogAndRun Assert git checkout $TRACKED_BRANCH
LogAndRun Assert git pull --rebase --ff-only --autostash
LogAndRun Assert git checkout -b "$NEW_BRANCH"
