#!/bin/bash

source ~/.bash_util.sh

set -e

NUMBER_CORES=$(grep ^cpu\\scores /proc/cpuinfo | awk '{print $4}' | uniq)
PROJECT_ROOT_DIR=$(git rev-parse --show-toplevel)

# For auto-discovery
touch "$PROJECT_ROOT_DIR/CMakeLists.txt"

QuietRun pushd "$PROJECT_ROOT_DIR/build"
echo "Compiling with jobs:" $NUMBER_CORES
make --jobs $NUMBER_CORES
QuietRun popd
