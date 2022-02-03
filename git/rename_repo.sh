#!/bin/bash

set -e

REPO_DIR="${1:-$(pwd)}"
REPO_NAME=$(basename "$REPO_DIR")

echo "Renaming repo: $REPO_NAME."

read -e -p "New project name: " -i "$REPO_NAME" new_name
read -p "Project Description Summary: " summary

THIS_DIR=$(dirname "$0")
OLD_NAME="psqlxx"
TEMPLATE_NAME="cpp-template-git"
OLD_SUMMARY="<Project Description Summary>"

pushd $REPO_DIR
git mv "$OLD_NAME" "$new_name"

sed -i "/$OLD_SUMMARY/q" "README.md"

EMAIL=$(git config user.email)
NICK_NAME="even"
if [[ "$EMAIL" == "*$NICK_NAME@*" ]]; then
    sed -i "s/-pplus/-$NICK_NAME/g" "README.md"
fi

$THIS_DIR/replace_all.sh "s/$OLD_NAME/$new_name/g" "$REPO_DIR"
$THIS_DIR/replace_all.sh "s/$TEMPLATE_NAME/$new_name/g" "$REPO_DIR"
$THIS_DIR/replace_all.sh "s/$OLD_SUMMARY/$summary/g" "$REPO_DIR"
popd
