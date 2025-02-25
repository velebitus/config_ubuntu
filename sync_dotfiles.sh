#! /bin/bash
cp -r $HOME/.config/nvim/ $HOME/config_ubuntu/dotfiles/
cp -r $HOME/.config/kitty/ $HOME/config_ubuntu/dotfiles/
cp -r $HOME/.config/i3/ $HOME/config_ubuntu/dotfiles/
cp -r $HOME/.config/i3status/ $HOME/config_ubuntu/dotfiles/

cp $HOME/.bashrc $HOME/config_ubuntu/dotfiles/

git status
git add .
git status
git commit -m "update config"
git push origin main


