#!/bin/bash

if [ $# -eq 1 ]; then
    COMMIT="$1"
    git difftool $COMMIT^ $COMMIT
else
    echo "Usage: $(basename $0) <commit>"
    exit 1
fi
