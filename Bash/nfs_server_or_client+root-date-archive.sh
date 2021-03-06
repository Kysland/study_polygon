#!/bin/bash

#server check
if [[ $(hostname) == "server" &&   -d /var/nfs-mount ]]; then
	echo "nfs server is already working"
	
#server install
elif [[ $(hostname) == "server" && ! -d /var/nfs-mount ]]; then
	sudo apt update
	sleep 2
	sudo apt install nfs-kernel-server nfs-common -y
	sleep 2
	sudo systemctl enable nfs-server
	sudo mkdir -p /var/nfs-mount
	sudo chown nobody:nogroup /var/nfs-mount
	sudo chmod 755 /var/nfs-mount
	sudo echo "/var/nfs-mount 192.168.1.0/24(rw,sync,fsid=0,crossmnt,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports
	sudo systemctl restart nfs-kernel-server

#client check	
elif [[ $(hostname) == "client" &&   -d /var/nfs-client ]]; then	
	echo "nfs client is already working"
	
#client install
elif [[ $(hostname) == "client" && ! -d /var/nfs-client ]]; then
	sudo apt update
	sleep 2
	sudo apt install nfs-common -y
	sleep 2
	sudo mkdir -p /var/nfs-client
	sudo chmod 755 /var/nfs-client
	sudo mount -t nfs -O uid=1000,iocharset=utf-8 192.168.1.15:/var/nfs-mount /var/nfs-client
	
#archive to nfs
			
	#client check, tar /root/, push to nfc
	if [[ $(hostname) == "client" &&   -d /var/nfs-client ]]; then	
		date=`date '+%d-%m-%Y-%H-%M-%S'`
		archive=archive_$date
		sudo tar czf $archive.tar.gz /root/. /home/*/.*
		sudo chmod 755 $archive.tar.gz
		sudo cp $archive.tar.gz /var/nfs_client
		sudo rm $archive.tar.gz
	else
		echo "fatal eror, do rm -rf *"
	fi
else
	echo "fatal eror, do rm -rf *"
fi