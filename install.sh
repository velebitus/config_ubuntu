#! /bin/bash

# initial update and upgrade
sudo apt update
sudo apt upgrade

# install i3
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734
sudo apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3

sudo apt install picom
sudo apt install git
sudo apt install kitty

sudo snap install keepassxc
sudo snap install discord

# cp dotfiles
cp -r $HOME/config_ubuntu/dotfiles/nvim/ $HOME/.config/nvim/
cp -r $HOME/config_ubuntu/dotfiles/kitty/ $HOME/.config/kitty/
cp -r $HOME/config_ubuntu/dotfiles/i3/ $HOME/.config/i3/ 
cp -r $HOME/config_ubuntu/dotfiles/i3status/ $HOME/.config/i3status/

cp $HOME/config_ubuntu/dotfiles/.bashrc $HOME/.bashrc

# enable touchpad in X
sudo cp ./other/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf

# give permissions for brightness script
# different for different computer systems
# current script designed for dell latitude 7430 intel i5
sudo chmod u+x /sys/class/backlight/intel_backlight/brightness

# firefox smooth scrolling
echo "MOZ_USE_XINPUT2=1" | sudo tee -a /etc/environment

# install neovim from source
# TODO
sudo apt install git make unzip ripgrep
sudo apt install gcc cmake ninja-build gettext curl build-essential
mkdir $HOME/repos/
cd $HOME/repos/
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
sudo make CMAKE_BUILD_TYPE=Release
sudo make install



