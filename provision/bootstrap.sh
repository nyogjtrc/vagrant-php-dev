#!/usr/bin/env bash

apt-get update

# git
apt-get -y install git git-doc

# nginx
apt-get -y install nginx

# php5
apt-get -y install php5-fpm php5-cli php5-dev php-pear php5-mysql php5-curl php5-mcrypt

# mysql
echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
apt-get -y install mysql-server

# redis
apt-get -y install redis-server

# nginx config
cp /vagrant/provision/config/nginx/* /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/develop.local /etc/nginx/sites-enabled/
service nginx restart
