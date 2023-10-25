#!/bin/bash

# Start here.  Enter these commands:
# sudo apt install git
# mkdir Code
# cd Code
# git clone https://github.com/AlexHarter/My-Debian-System
# cd My-Debian-System
# ./alex-install.sh

# apt frontend: nala
sudo apt install -y nala

# Display Server: X
sudo nala install -y xorg

#Window Manager: i3
sudo nala install -y i3

# Display Manager: ly
sudo nala install build-essential libpam0g-dev libxcb-xkb-dev # Dependencies

cd /
sudo git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
sudo make
sudo make install installsystemd
sudo systemctl enable ly.service

# Terminal: kitty
sudo nala install kitty

# File Manager: Thunar
sudo nala  install -y thunar # TODO look at alternatives

# Audio
sudo nala install -y pipewire-audio

# Bluetooth
#sudo nala install -y bluez blueman
#sudo systemctl enable bluetooth

# Fonts
sudo apt install fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus 

# Install Nerd Fonts
source ~/Code/My-Debian-System/nerdfonts.sh

# Torrent Client: qbittorrent
sudo apt install qbittorrent

# Web Browser: Brave
sudo nala install -y curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser

#sudo nala install appimagelauncher #not found

# Obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.16/Obsidian-1.4.16.AppImage # Modify to be version-agnostic
appimagelauncher Obsidian-1.4.16.AppImage

# Chrysalis for Keyboardio Keyboards
wget https://github.com/keyboardio/Chrysalis/releases/download/v0.13.2/Chrysalis-0.13.2-x64.AppImage
appimagelauncher Chrysalis-0.13.2-x64

source ~/Code/My-Debian-System/coding.sh
source ~/Code/My-Debian-System/publishing.sh
source ~/Code/My-Debian-System/music.sh
source ~/Code/My-Debian-System/gaming.sh

sudo reboot now
