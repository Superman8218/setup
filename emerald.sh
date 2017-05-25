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

sudo pip install virtualenv
sudo pip install virtualenvwrapper

sudo apt-get install -y postgresql
sudo apt-get install -y postgresql-contrib
sudo apt-get install -y libpq-dev

python manage.py makemigrations
python manage.py migrate

cat <<EOF | python manage.py shell
from accounts.models import EmeraldUser
EmeraldUser.objects.filter(email="zac.yauney@gmail.com").exists() or \
    EmeraldUser.objects.create_superuser(email="zac.yauney@gmail.com", password="confidence")
EOF
