cd ~/development/emerald

pg_ctl start -D /var/lib/pgsql/data

su --login postgres --command "createdb emerald"
su --login postgres --command "createuser -s zac"
su --login postgres --command "GRANT ALL PRIVILEGES ON DATABASE emerald to zac;"


