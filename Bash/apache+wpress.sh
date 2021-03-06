#!/bin/bash

sudo apt-get update

#apache + config
sudo apt install apache2 -y
sleep 5
sudo apt-get update
echo "enter site name:"
read site
sudo touch /etc/apache2/sites-available/$site.conf
echo "<VirtualHost *:80>" | sudo tee /etc/apache2/sites-available/$site.conf
echo "	ServerName $site" | sudo tee -a /etc/apache2/sites-available/$site.conf
echo "	ServerAdmin webmaster@host" | sudo tee -a /etc/apache2/sites-available/$site.conf
echo "	DocumentRoot /var/www/$site" | sudo tee -a /etc/apache2/sites-available/$site.conf
errlog=$site"_error"
echo "	ErrorLog \${APACHE_LOG_DIR}/$errlog.log" | sudo tee -a /etc/apache2/sites-available/$site.conf
acclog=$site"_access"
echo "	CustomLog \${APACHE_LOG_DIR}/$acclog.log combined" | sudo tee -a /etc/apache2/sites-available/$site.conf
echo "</VirtualHost>" | sudo tee -a /etc/apache2/sites-available/$site.conf

#php
sudo apt install php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-cli php7.0-cgi php7.0-gd -y
sleep 5
sudo apt-get update

#db
sudo apt install mysql-client mysql-server -y
sleep 5
sudo apt-get update
sleep 2
echo "enter db name:"
read db
echo "enter user name:"
read usr
echo "enter db password:"
read passdb
sleep 2
mysql -u root <<MYSQL_SCRIPT
CREATE DATABASE $db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER '$usr'@'localhost' IDENTIFIED BY '$passdb';
GRANT ALL PRIVILEGES ON $db.* TO '$usr'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

#wp
cd /var/www/html/
sudo rm *
cd -
mkdir $site
cd /var/www/$site/
sudo wget https://ru.wordpress.org/latest-ru_RU.tar.gz
sudo tar xzf latest-ru_RU.tar.gz
sleep 2
sudo rm latest-ru_RU.tar.gz
sudo cp /var/www/wordpress/ /var/www/$site/
sudo a2ensite $site.conf

sudo service apache2 restart