#!/bin/bash


##
# @reference    Repeatedly run a shell command until it fails?
#               https://stackoverflow.com/questions/12967232/repeatedly-run-a-shell-command-until-it-fails
##
if [ $# -eq 1 ]; then
    while "$@"; do :; done
else
    echo "Usage: $(basename $0) <command>"
    echo " Example: run_until_fail.sh ctest --output-on-failure -R <regex>"
    exit 1
fi
