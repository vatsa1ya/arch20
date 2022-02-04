git clone https://aur.archlinux.org/foo2zjs-nightly.git

cd foo2zjs-nightly
makepkg -si

sudo systemctl enable cups
sudo systemctl start cups

sudo pacman -S system-config-printer

reboot