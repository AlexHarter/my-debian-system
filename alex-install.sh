#!/bin/bash

# TODO create folders for auxillary scripts

# Start here.  Enter these commands:
# sudo apt install git
# mkdir ~/Code
# cd ~/Code
# git clone https://github.com/AlexHarter/My-Debian-System
# cd ~/Code/My-Debian-System
# chmod +x ~/Code/My-Debian-System/alex-install.sh
# ./alex-install.sh

mkdir ~/Downloads

# apt frontend: nala
sudo apt install -y nala

# Display Server: X
sudo nala install -y xorg

#Window Manager: i3
sudo nala install -y i3
# TODO copy config to ~/.config/i3/

# TODO enable natural scrolling

# TODO replace dmenu with Rofi

# Display Manager: ly
sudo nala install -y build-essential libpam0g-dev libxcb-xkb-dev # Dependencies

cd /
sudo git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
sudo make
sudo make install -y installsystemd
sudo systemctl enable ly.service

# Terminal: kitty
sudo nala install kitty

# File Manager: Thunar
sudo nala  install -y thunar # TODO look for an alternative

# Audio
sudo nala install -y pipewire-audio

# Bluetooth
#sudo nala install -y bluez blueman
#sudo systemctl enable bluetooth

# Fonts
sudo nala install -y fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus 

# Install Nerd Fonts
source ~/Code/My-Debian-System/nerdfonts.sh

# Torrent Client: qbittorrent
sudo nala install -y qbittorrent

# Web Browser: Brave
sudo nala install -y curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install -y brave-browser

#sudo nala install appimagelauncher # TODO fix this

# Obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.16/Obsidian-1.4.16.AppImage # TODO change to .deb # TODO download to Downloads folder # TODO Modify to be version-agnostic
appimagelauncher Obsidian-1.4.16.AppImage

# Discord
wget https://discord.com/api/download?platform=linux&format=deb
sudo nala install -y ~/Downloads/discord-0.0.32.deb

# Chrysalis for Keyboardio Keyboards
wget https://github.com/keyboardio/Chrysalis/releases/download/v0.13.2/Chrysalis-0.13.2-x64.AppImage
appimagelauncher Chrysalis-0.13.2-x64

source ~/Code/My-Debian-System/coding.sh
source ~/Code/My-Debian-System/publishing.sh
source ~/Code/My-Debian-System/music.sh
source ~/Code/My-Debian-System/gaming.sh

sudo reboot nowdmenu