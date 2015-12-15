#!/usr/bin/env bash
set -e
set -u

rm -f ./plugins.txt*
for dir in $(ls -1d bundle/*/)
do
    echo "$dir" $(grep "url" "$dir/.git/config" | sed 's/^.*= //') >> ./plugins.txt.tmp
done

sort ./plugins.txt.tmp | uniq > ./plugins.txt
rm -f ./plugins.txt.tmp 
