#!/bin/sh

# To be used for quick setup of dev environment containers and VMs

# Run with this command:
# ./setup [apt, apt-get, yum, etc]
PKG_MAN=$1

## vim and vim-enhanced for text editing
## git and tig for version control
## tmux for using panes in the terminal
sudo $PKG_MAN update && sudo $PKG_MAN upgrade
sudo $PKG_MAN install -y git tig tmux vim vim-enhanced

# install vim-plug plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# having cloned this repo, copy my .vimrc
cp .vimrc ~/.vimrc
cp .gitconfig ~/.gitconfig
