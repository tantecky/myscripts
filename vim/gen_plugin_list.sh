#!/usr/bin/env bash
set -e
set -u

rm -rf ./pkgs.txt
for dir in $(ls -1d bundle/*/)
do
    echo "$dir" $(grep "url" "$dir/.git/config" | sed 's/^.*= //') >> ./plugins.txt
done
