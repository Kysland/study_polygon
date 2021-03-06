#!/bin/bash

#zabbix check
zab_check=`sudo apt list --installed | grep zabbix`
if [ "${zab_check}" != "" ]; then
	echo "zabbix is already working"
	exit
else
#server install
	if [[ $(hostname) == "server"]]; then
	#packages install
	sudo apt update
	sudo apt-get install php php-devel php-bcmath php-pear php-gd php-mbstring php-mysql php-xml apache2 mariadb-server mariadb-client -y
	sudo wget https://repo.zabbix.com/zabbix/4.2/debian/pool/main/z/zabbix-release/zabbix-release_4.2-2+buster_all.deb
	sudo dpkg -i zabbix-release_4.2-2+buster_all.deb
	sudo apt update
	sudo apt -y install zabbix-server-mysql zabbix-frontend-php
	sudo systemctl restart mariadb
	sudo systemctl restart mysql
	#db config
	sudo mysql -u root -e "create database zabbix character set utf8 collate utf8_bin;"
	sudo mysql -uroot -e "grant all privileges on zabbix.* to zabbix@localhost identified by '1111';"
	sudo mysql -uroot -e "FLUSH PRIVILEGES;"
	sudo mysql -uroot -e "quit"
	sudo zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -u zabbix -p zabbix -uroot -p1111
	#zabbix config
	sudo echo "DBHost=localhost" | tee -a  /etc/zabbix/zabbix_server.conf
	sudo echo "DBPassword=1111" | tee -a  /etc/zabbix/zabbix_server.conf
	sudo sed -i 's/# php_value/php_value/g' /etc/zabbix/apache.conf
	sudo systemctl restart apache2
	sudo systemctl start zabbix-server
	systemctl enable zabbix-server
#client install (!= "server")- мы же хотим мониторить всех
	elif [[ $(hostname) != "server"]]; then
	#packages install
	sudo apt update
	sudo wget https://repo.zabbix.com/zabbix/4.2/debian/pool/main/z/zabbix-release/zabbix-release_4.2-2+buster_all.deb
	sudo dpkg -i zabbix-release_4.2-2+buster_all.deb
	sudo apt update
	sudo apt install zabbix-agent
	#zabbix config
	sudo sed -i 's/Server=127.0.0.1/Server=192.168.1.15/g' /etc/zabbix/zabbix_agentd.conf
	sudo sed -i 's/ServerActive=127.0.0.1/ServerActive=192.168.100.28/g' /etc/zabbix/zabbix_agentd.conf
	sudo sed -i 's/Hostname=Zabbix server/Hostname=Client/g' /etc/zabbix/zabbix_agentd.conf
	sudo echo "Timeout=10" | tee -a  /etc/zabbix/zabbix_agentd.conf
	sudo systemctl start zabbix-agent
	fi
fi