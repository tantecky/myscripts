#!/usr/bin/env bash
set -e
set -u

mkdir -p bundle

while read dir url
do
  # plugin folder exists => pull it
  if [[ -e $dir ]]; then
    echo "Pulling:" $dir
    cd $dir
    git pull
    cd - > /dev/null
  # plugin folder does not exist => clone it
  else
    cd bundle
    echo "Cloning:" $url
    git clone $url
    cd > /dev/null
  fi
done < ./plugins.txt


for dir in $(ls -1d bundle/*/)
do
  # untracked plugin/folder => delete it
  if [[ $(grep "$dir" ./plugins.txt | wc -l) -eq 0 ]]; then
    echo "Removing:" $dir
    rm -rf "$dir"
  fi
done
