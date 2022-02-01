#! /bin/bash

## SettingTime ##
echo Setting Time
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc

## Installing Essentials ##

echo '###Installing Essentials###'
pacman -S nano sudo networkmanager base-devel -y

## Generating Locales ###

nano /etc/locale.gen
locale-gen

nano /etc/hostname
nano /etc/hosts

read -p 'Username: ' user
passwd
useradd -m $user
passwd $user

usermod -aG wheel,audio,video,storage,optical $user

EDITOR=nano visudo

pacman -S grub efibootmgr dosfstools mtools os-prober -y

mkdir /boot/EFI

mount /dev/nvme0n1p1 /boot/EFI

grub-install --target=x86_64-efi --bootloader-id=GRUB --recheck

grub-mkconfig -o /boot/grub/grub.cfg
nano /etc/pacman.conf
pacman -Sy plasma-meta steam discord fish neofetch htop telegram-desktop obs-studio code vlc -y

exit
umount -a
reboot