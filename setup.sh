#!/bin/bash
# Zac's Ubuntu Setup Script

# Things that are generally important to have
sudo apt-get install -y curl
sudo apt-get install pip

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
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

# Install Vundle and .vim folder

if [ ! -d ./.vim/ ]; then
    git clone https://github.com/Superman8218/vim.git .vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi 
