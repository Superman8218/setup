#!/bin/bash
# Zac's Ubuntu Setup Script

# Things that are generally important to have

# For now these are commented out because they need to be idempotent

#sudo apt-get install -y curl
#sudo apt-get install pip

cd $HOME

# Install virtual environments

if [ ! -d ./envs/ ]; then
    git clone https://github.com/Superman8218/envs.git
fi

# git pull and install dotfiles as well

if [ ! -d ./dotfiles/ ]; then
    git clone https://github.com/Superman8218/dotfiles.git
    ln -sb dotfiles/.screenrc .
    ln -sb dotfiles/.bash_profile .
    ln -sb dotfiles/.bashrc .
    ln -sb dotfiles/.bashrc_custom .
    ln -sb dotfiles/.bash_aliases .
    ln -sf dotfiles/.emacs.d .
    ln -sb dotfiles/.vimrc .
    ln -sb dotfiles/.tmux.conf .
    ln -sb dotfiles/.Xresources .
    ln -sb dotfiles/.Xresources.d .
fi

# Install Vundle and .vim folder

if [ ! -d ./.vim/ ]; then
    git clone https://github.com/Superman8218/vim.git .vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi 

