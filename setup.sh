#!/bin/bash

# Must run as root
if [[ $# -lt 1 ]]; then
  echo "Run with the name of package manager.\n e.g. ./setup.sh apt"
  exit
fi

function exit_or_print() {
  if [[ $? -ne 0 ]]; then
    echo "  ¬! Failure in script!"
    exit 1
  elif [[ $# -gt 0 ]]; then
    echo "  ¬¬ "$1
  fi
  return
}

# To be used for quick setup of dev environment containers and VMs

# Run with this command:
# ./setup [apt, apt-get, yum, etc]
PKG_MAN=$1
# Check this exists
if [[ "$(which $PKG_MAN)" == "" ]]; then
  exit 1
fi

## vim and vim-enhanced for text editing
## git and tig for version control
## tmux for using panes in the terminal

exit_or_print "Installing dev tools"
# sudo $PKG_MAN update && \
     # $PKG_MAN upgrade && \
# sudo $PKG_MAN install lynx
     # $PKG_MAN install -y tree git tig tmux vim neovim zsh fonts-powerline
# fonts-powerline only required for some zsh themes
# having cloned this repo, copy my .vimrc

exit_or_print "Updating config files for nvim and git"
# install vim-plug plugin manager
# curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# cp .vimrc ~/.config/init.vim
# cp .gitconfig ~/.gitconfig

exit_or_print "Customizing zsh"
# install oh-my-zsh plugin manager
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# cp .zshrc ~/.zshrc
# cp .oh-my-zshrc ~/.omzrc ??

# Run this, then user must manually logout and back in
# chsh -s $(which zsh)
exit_or_print "Now manually logout and login again for this to take effect"

