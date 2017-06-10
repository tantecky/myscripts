#!/usr/bin/env bash
set -u
set -e

curl -sL https://raw.githubusercontent.com/tantecky/myscripts/master/vim/bootstrap.sh | bash
curl -sL https://raw.githubusercontent.com/tantecky/myscripts/master/bashrc_bootstrap.sh | bash

# other small stuff
ln -sf ~/myscripts/tmux.conf ~/.tmux.conf

echo Run '. ~/.bashrc.my' in current terminal
