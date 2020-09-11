#!/bin/bash

##
# @reference    Repeatedly run a shell command until it fails?
#               https://stackoverflow.com/questions/12967232/repeatedly-run-a-shell-command-until-it-fails
##
if [ $# -eq 0 ]; then
    echo "Usage: $(basename $0) <command>"
    echo " Example: run_until_fail.sh ctest --output-on-failure -R <regex>"
    exit 1
else
    while "$@"; do :; done
fi
