#!/bin/bash

# TODO create folders for auxillary scripts

# Start here.  Enter these commands:
# sudo apt install nala
# sudo nala install git
# mkdir ~/Code
# cd ~/Code
# git clone https://github.com/AlexHarter/My-Debian-System
# cd ~/Code/My-Debian-System
# chmod +x ~/Code/My-Debian-System/alex-install.sh
# ./alex-install.sh

mkdir ~/Code ~/Downloads ~/Documents ~/Music ~/Pictures ~/Videos

#Window Manager: dwm
## Dependencies
sudo nala install -y xorg
sudo wget https://git.suckless.org/dwm

# TODO enable natural scrolling

# TODO replace dmenu with Rofi

# Terminal: kitty
sudo nala install kitty

# File Manager: nnn
sudo nala  install -y nnn # TODO look for an alternative

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
