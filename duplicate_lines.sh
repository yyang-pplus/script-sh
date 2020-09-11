#!/bin/bash

##
# @reference    Find duplicate lines in a file and count how many time each line was duplicated?
#               https://stackoverflow.com/questions/6712437/find-duplicate-lines-in-a-file-and-count-how-many-time-each-line-was-duplicated
##
if [ $# -eq 1 ]; then
    FILE="$1"
    sort "$FILE" | uniq --count --repeated
else
    echo "Usage: $(basename $0) <file>"
    exit 1
fi
