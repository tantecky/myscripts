#!/usr/bin/env bash
set -u
set -e

REPO='https://github.com/tantecky/myscripts.git'
SCRIPT_DIR="~/myscripts"
eval SCRIPT_DIR=$SCRIPT_DIR

function add_to_file() {
local file="$1"
if [[ -e ~/$file ]]; then
  # need .bashrc patching
  if [[ $(grep -c bashrc\.my ~/$file) -eq 0 ]]; then
    echo -e '\n# my bashrc\nif [ -f ~/.bashrc.my ]; then . ~/.bashrc.my; fi' >> ~/$file
  fi
else
  echo -e '\n# my bashrc\nif [ -f ~/.bashrc.my ]; then . ~/.bashrc.my; fi' >> ~/$file
fi
}

if [[ -e $SCRIPT_DIR ]]; then
  cd $SCRIPT_DIR
  git pull
else
  cd ~
  git clone $REPO
fi

add_to_file .bashrc 
if [[ $(uname) == 'FreeBSD' ]]; then
  add_to_file .profile 
fi

ln -sf $SCRIPT_DIR/bashrc.my ~/.bashrc.my
set +u
. ~/.bashrc.my
