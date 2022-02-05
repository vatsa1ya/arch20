#! /bin/bash

## SettingTime ##
echo Setting Time
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc

## Installing Essentials ##

echo '###Installing Essentials###'
pacman -S nano sudo networkmanager base-devel -y

## Generating Locales ###

nano /etc/locale.gen
locale-gen

nano /etc/hostname
nano /etc/hosts

echo 'Adding User And Setting Root Password'
echo 'Set Root Password'
passwd
read -p 'Username: ' user
useradd -m $user
echo 'Set User Password'
passwd $user

usermod -aG wheel,audio,video,storage,optical $user

EDITOR=nano visudo
echo 'Installing GRUB'
pacman -S grub dosfstools mtools os-prober -y

grub-install --target=i386-pc /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

nano /etc/pacman.conf

pacman -Sy ufw packagekit-qt5 pulseaudio pulseaudio-bluetooth bluez bluez-utils fish neofetch htop -y

### Enabling Services ###

echo '### Enabling Services ###'
sudo systemctl enable NetworkManager
sudo systemctl enable sddm
sudo systemctl enable ufw
sudo systemctl enable bluetooth



