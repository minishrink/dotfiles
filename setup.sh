#!/bin/bash

# To be used for quick setup of dev environment containers and VMs
# This is not a secure or tidy script but it does work for me!

# Stop the script as soon as something fails
function exit_or_print() {
  if [[ $? -ne 0 ]]; then
    echo "  ¬! That failed! Exiting..."
    exit 1
  elif [[ $# -gt 0 ]]; then
    echo "  ¬¬ "$1
  fi
  return
}

# ¬¬¬ Script entry point

# We need the name of the package manager to install some stuff
# Script should be called like this:
#     ./setup [apt, apt-get, yum, etc]
if [[ $# -lt 1 ]]; then
  echo "Run with the name of package manager.\n e.g. ./setup.sh apt"
  exit
fi

PKG_MAN=$1

# Check this package manager exists
# A smarter script would check the program is actually a package manager
# This one just prints nice output
if [[ "$(which $PKG_MAN)" == "" ]]; then
  echo "  ¬! Invalid package manager '$PKG_MAN': could not be found in PATH or is not executable"
  exit 1
fi

# Time to install my nice things
exit_or_print "Installing dev tools"
sudo $PKG_MAN update && \
# vim and neovim for text editing
# git and tig for version control
# tmux allows using panes in the terminal
# zsh is just pretty, especially with fonts-powerline themes
sudo $PKG_MAN install -y tree git tig tmux vim neovim zsh lynx fonts-powerline

# Time to configure my dev tools
exit_or_print "Configuring git and (neo)vim"
cp .gitconfig ~/.gitconfig
# install vim plugin manager
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/.config/init.vim
# Symlink vimrc to neovim config
ln -siv ~/.vimrc ~/.config/init.vim

# Now to make the terminal pretty
exit_or_print "Customizing zsh, setting as default"
# install oh-my-zsh plugin manager
curl -fsSL "https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

# Change default shell to zsh
chsh -s $(which zsh)
exit_or_print "Now manually logout and login again for this to take effect"

