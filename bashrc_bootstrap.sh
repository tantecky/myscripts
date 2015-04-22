#!/usr/bin/env bash
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
  if [[ $(grep -c bashrc\.my ~/.bashrc) -eq 0 ]]; then

  fi
fi

ln -sf $SCRIPT_DIR/
