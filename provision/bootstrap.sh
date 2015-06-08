#!/usr/bin/env bash


apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list

apt-get update

# git
apt-get -y install git git-doc

# nginx
apt-get -y install nginx

# php5
apt-get -y install php5-fpm php5-cli php5-dev php5-common php-pear php5-mysql curl php5-curl php5-mcrypt php5-gd

# mysql
echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
apt-get -y install mysql-server

echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password root" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password root" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password root" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections
apt-get -y install phpmyadmin

# redis
apt-get -y install redis-server

# mongodb
apt-get install -y mongodb-org

# nginx config
cp -f /vagrant/provision/config/nginx/* /etc/nginx/sites-available/
ln -fs /etc/nginx/sites-available/develop.local /etc/nginx/sites-enabled/
service nginx restart
