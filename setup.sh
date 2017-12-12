#!/bin/bash

# install the following to a RHEL distro using yum package manager
## vim and vim-enhanced for text editing
## git and tig for version control
## tmux for using panes in the terminal
sudo yum update && sudo yum upgrade
sudo yum install -y git tig tmux vim vim-enhanced

# install vim-plug plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# having cloned this repo, copy my .vimrc
cp .vimrc ~/.vimrc

# install plugins and set my colourscheme
vim -c ':w' -c ':so %' -c 'PlugInstall' -c ':colo minimalist' -c ':wq' ~/.vimrc

# use my fucking colourscheme
echo alias vim="vim -c ':colo minimalist'" >> ~/.bash_aliases && source ~/.bash_aliases
