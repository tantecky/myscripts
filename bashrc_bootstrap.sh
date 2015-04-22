#!/usr/bin/env bash
set -u
set -e

REPO='https://github.com/tantecky/myscripts.git'
SCRIPT_DIR="~/myscripts"
eval SCRIPT_DIR=$SCRIPT_DIR

if [[ -e $SCRIPT_DIR ]]; then
  cd $SCRIPT_DIR
  git pull
else
  cd ~
  git clone $REPO
fi

if [[ -e ~/.bashrc ]]; then
  # need .bashrc patching
  if [[ $(grep -c bashrc\.my ~/.bashrc) -eq 0 ]]; then
    echo -e '\n# my bashrc\nif [ -f ~/.bashrc.my ]; then . ~/.bashrc.my; fi' >> ~/.bashrc
  fi
else
  echo -e '\n# my bashrc\nif [ -f ~/.bashrc.my ]; then . ~/.bashrc.my; fi' >> ~/.bashrc
fi

ln -sf $SCRIPT_DIR/bashrc.my ~/.bashrc.my
. ~/.bashrc.my
