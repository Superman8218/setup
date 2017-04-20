#!/bin/bash
# Zac's Ubuntu Setup Script

# Things that are generally important to have

# For now these are commented out because they need to be idempotent

#sudo apt-get install -y curl
#sudo apt-get install pip

cd $HOME

# Upgrade pip

pip install --upgrade pip

# Install virtual environments:
# 1. Install the pip packages
# 2. Get latest environments from git

pip install virtualenv
pip install virtualenvwrapper


if [ ! -d ./envs/ ];
then
    git clone https://github.com/Superman8218/envs.git
else
    cd ~/envs/
    git pull
    cd $HOME
fi

# git pull and install dotfiles as well

if [ ! -d ./dotfiles/ ];
then
    git clone https://github.com/Superman8218/dotfiles.git
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
ln -sb dotfiles/.envars .
ln -sb dotfiles/.i3config .config/i3/config

# Install Vundle and .vim folder

if [ ! -d ./.vim/ ];
then
    git clone https://github.com/Superman8218/vim.git .vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
else
    cd ~/.vim/
    git pull
    cd $HOME
fi 

# Install Emerald Dependencies

dnf install postgresql
dnf install postgresql-devel
dnf install postgresql-server
dnf install redhat-rpm-config
dnf install python-devel

# To get Postgres to run, this command must be run as the postgres user
# su postgres
# pg_ctl start -D /var/lib/pgsql/data
# su root

