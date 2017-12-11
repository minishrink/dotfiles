!#/bin/bash

sudo yum install -y vim vim-enhanced
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -o ~/.vimrc "https://raw.githubusercontent.com/minishrink/dotfiles/master/.vimrc"
vim -c ':w' -c ':so %' -c 'PlugInstall' -c ':colo minimalist' ~/.vimrc
