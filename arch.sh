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
read -p 'Set Username: ' user
useradd -m $user
echo 'Set User Password'
passwd $user
echo 'Set Root Password'
passwd

usermod -aG wheel,audio,video,storage,optical $user

EDITOR=nano visudo
echo 'Installing GRUB'
pacman -S grub efibootmgr dosfstools mtools os-prober -y

mkdir /boot/EFI

mount /dev/nvme0n1p1 /boot/EFI

grub-install --target=x86_64-efi --bootloader-id=GRUB --recheck

grub-mkconfig -o /boot/grub/grub.cfg

nano /etc/pacman.conf

pacman -Sy plasma-meta gparted steam ufw konsole dolphin dolphin-plugins packagekit-qt5 pulseaudio pulseaudio-bluetooth bluez bluez-utils discord fish neofetch htop telegram-desktop obs-studio code vlc -y

### Enabling Services ###

echo '### Enabling Services ###'
sudo systemctl enable NetworkManager
sudo systemctl enable sddm
sudo systemctl enable ufw
sudo systemctl enable bluetooth

### Setting Up Firewall ###

echo '### Setting Up Firewall ###'
ufw default deny
ufw allow from 192.168.0.0/24
ufw deny Deluge
ufw deny ssh
ufw enable