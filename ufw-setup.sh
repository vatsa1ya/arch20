#! /bin/bash
echo '### Setting Up Firewall ###'
ufw default deny
ufw allow from 192.168.0.0/24
ufw deny Deluge
ufw deny ssh
ufw enable