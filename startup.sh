installation/
./ufw-setup.sh

fish

sudo rm -rf ~/.config/fish/config.fish
sudo mkdir ~/.config/fish/functions

cp fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
cp config.fish ~/.config/fish/config.fish

chsh -s /bin/fish
exit

