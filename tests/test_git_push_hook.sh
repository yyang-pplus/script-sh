#!/bin/bash


source ~/.bash_util.sh


git checkout master

AssertNot git push --dry-run

Assert git push --dry-run origin HEAD:refs/for/master
