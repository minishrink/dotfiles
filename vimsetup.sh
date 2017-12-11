!#/bin/bash

# install vim to a RHEL distro using yum package manager
sudo yum install -y vim vim-enhanced

# install vim-plug plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# download my .vimrc
curl -o ~/.vimrc "https://raw.githubusercontent.com/minishrink/dotfiles/master/.vimrc"

# install plugins and set my colourscheme
vim -c ':w' -c ':so %' -c 'PlugInstall' -c ':colo minimalist' -c ':wq' ~/.vimrc
