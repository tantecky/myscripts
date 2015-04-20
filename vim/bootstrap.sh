#!/usr/bin/env bash
set -u
set -e

REPO='https://github.com/tantecky/myscripts.git'
SCRIPT_DIR="~/myscripts"
eval SCRIPT_DIR=$SCRIPT_DIR
VIM_DIR="$SCRIPT_DIR/vim"

if [[ -e $SCRIPT_DIR ]]; then
  cd $VIM_DIR
  git pull
else
  cd ~
  git clone $REPO
fi

cd $VIM_DIR

./update_plugins.sh
rm -rf ~/.vimrc
rm -rf ~/.vim
cd ~
ln -s "$SCRIPT_DIR/vim" .vim
ln -s "$SCRIPT_DIR/vim/.vimrc" .vimrc
