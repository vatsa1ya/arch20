#! /bin/bash
echo '### Setting Up Firewall ###'
sudo ufw default deny
sudo ufw allow from 192.168.0.0/24
sudo ufw deny Deluge
sudo ufw deny ssh
sudo ufw enable