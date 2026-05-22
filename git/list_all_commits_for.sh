#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") <KEYWORD|TICKET>"
    echo " Example: $(basename "$0") ABC-1234"
    echo " Or combine it with other commands:"
    echo "  git cherry-pick -e \$($(basename "$0") ABC-1234)"
    exit 1
fi

ticket="$1"
git --no-pager log --no-merges --reverse --format=%H --extended-regexp --grep="\b${ticket}\b" --all
