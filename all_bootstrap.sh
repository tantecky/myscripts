#!/usr/bin/env bash
set -u
set -e

curl -sL http://tinyurl.com/dotvimrc | bash
curl -sL http://tinyurl.com/dotbashrc | bash
echo Run '. ~/.bashrc.my' in current terminal
