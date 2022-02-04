cd \installation/
./ufw-setup.sh

fish

rm -rf ~/.config/fish/config.fish
mkdir ~/.config/fish/functions

cp \installation\fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
cp \installation\config.fish ~/.config/fish/config.fish

exit

