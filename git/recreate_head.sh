#!/bin/bash

set -euo pipefail

git reset --soft HEAD^
git commit --reuse-message ORIG_HEAD
