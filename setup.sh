#!/bin/bash
# Zac's Ubuntu Setup Script

# Things that are generally important to have 
# For now these are commented out because they need to be idempotent

cd $HOME

#Install packages

sudo xargs apt-get install -y <setup/packages.txt
sudo xargs apt-get install -y <setup/misc.txt

# Set default shell

chsh -s $(which zsh)

# Virtual environments

if [ ! -d ./envs/ ];
then
    git clone git@github.com:Superman8218/envs.git
	sudo chown -R $USER:$USER envs else
    cd ~/envs/
    git pull
    cd $HOME
fi

# git pull and install dotfiles as well

if [ ! -d ./dotfiles/ ];
then
    git clone --recursive git@github.com:Superman8218/dotfiles.git
	sudo chown -R $USER:$USER dotfiles
else
    cd ~/dotfiles/
    git pull
    cd $HOME
fi

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
ln -sb dotfiles/.xinitrc
ln -sb dotfiles/.envars .
ln -sb dotfiles/.gitconfig .
ln -sbd dotfiles/.i3 .
ln -sb dotfiles/.zshrc .
ln -sbd dotfiles/.oh-my-zsh .
ln -sbd dotfiles/.vim .

# Install Vundle and .vim folder

if [ ! -d ./dotfiles/.vim/bundle/Vundle.vim ];
then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/.vim/bundle/Vundle.vim
else
    cd ~/.vim/
    git pull
    cd $HOME
fi

# Generate ssh key

if [ ! -d ./.ssh ];
then
	mkdir .ssh
fi

if [ ! -f ./.ssh/id_rsa.pub ];
then
	ssh-keygen -t rsa -b 4096 -C "zac.yauney@gmail.com"
fi
