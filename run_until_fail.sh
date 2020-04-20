#!/bin/bash

##
# Usage: run_until_fail.sh [command]
# Example: run_until_fail.sh ctest --output-on-failure -R "test_name_pattern"
##

while "$@"; do :; done
