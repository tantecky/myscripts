#!/usr/bin/env bash
set -u
set -e

curl -sL http://tinyurl.com/dotvimrc | bash
curl -sL http://tinyurl.com/dotbashrc | bash

# other small stuff
ln -sf ~/myscripts/tmux.conf ~/.tmux.conf

echo Run '. ~/.bashrc.my' in current terminal
