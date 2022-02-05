installation/
sudo chmod +x ufw-setup.sh
sudo chmod +x hp1020.sh

./ufw-setup.sh

fish

sudo rm -rf ~/.config/fish/config.fish
sudo mkdir ~/.config/fish/functions

cp fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
cp config.fish ~/.config/fish/config.fish

chsh -s /bin/fish

./hp1020.sh

git clone https://aur.archlinux.org/google-chrome.git
cd google-chrome
makepkg -si

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --import -
cd ..
git clone https://aur.archlinux.org/spotify.git
cd spotify
makepkg -si


reboot