installation/
sudo chmod +x ufw-setup.sh
sudo chmod +x hp1020.sh

./ufw-setup.sh

fish

exit

sudo rm -rf ~/.config/fish/config.fish
sudo mkdir ~/.config/fish/functions

cp fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
cp config.fish ~/.config/fish/config.fish

chsh -s /bin/fish

./hp1020.sh
