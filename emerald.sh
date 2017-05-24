cd $HOME

if [ ! -d ./development ];
then
	mkdir development
fi

if [ ! -d ./development/emerald ];
then
	cd development
	git clone git@github.com:Superman8218/emerald.git
	cd $HOME
fi

cd development/emerald

if [ ! hash "pip" &> /dev/null];
then
	wget https://bootstrap.pypa.io/get-pip.py get_pip.py
	python get-pip.py
	rm get_pip.py
fi

su root
pip install virtualenv
pip install virtualenvwrapper
exit

sudo apt-get install -y postgresql
sudo apt-get install -y postgresql-contrib
sudo apt-get install -y libpq-dev
