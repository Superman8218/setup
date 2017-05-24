if [ ! -d ./.oh-my-zsh/ ];
then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install powerline

pip install --user powerline-status

# Install powerline fonts

git clone https://github.com/powerline/fonts.git ~/.fonts
fc-cache -vf ~/.fonts
