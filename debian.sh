#! /bin/bash

## SettingTime ##
echo Setting Time
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc

## Installing Essentials ##

echo '###Installing Essentials###'
apt install nano sudo networkmanager base-devel -y

## Generating Locales ###

nano /etc/locale.gen
locale-gen

read -p 'Type Your Username: ' user

usermod -aG wheel,audio,video,storage,optical $user

EDITOR=nano visudo

apt install gparted steam ufw pulseaudio pulseaudio-bluetooth bluez bluez-utils discord fish neofetch htop telegram-desktop obs-studio code vlc -y

### Enabling Services ###

echo '### Enabling Services ###'
sudo systemctl enable NetworkManager
sudo systemctl start ufw
sudo systemctl enable ufw
sudo systemctl enable bluetooth

### Setting Up Firewall ###

echo '### Setting Up Firewall ###'
ufw default deny
ufw allow from 192.168.0.0/24
ufw deny Deluge
ufw deny ssh
ufw enable