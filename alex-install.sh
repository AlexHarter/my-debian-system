#!/bin/bash

# Start here.  Enter these commands:
# sudo apt install nala
# sudo nala install git
# mkdir ~/Code
# cd ~/Code
# git clone https://github.com/AlexHarter/My-Debian-System
# cd ~/Code/My-Debian-System
# chmod +x ~/Code/My-Debian-System/alex-install.sh
# ./alex-install.sh

# APT INSTALLATIONS
# Window Manager: i3
# Launcher: rofi
# File Manager: nnn
# Audio: pipewire
# Bluetooth: bluez blueman
# Torrent Client: qbittorrent
sudo nala install -y xorg i3 rofi nnn pipewire-audio flatpak qbittorrent
sudo systemctl enable bluetooth

# CONFIGURATION
# TODO replace i3 config with my own
# TODO enable natural scrolling
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# FLATPAKS
# Web Browser: Brave
# Discord
# Obsidian
# Sublime
sudo flatpak install brave-browser discord obsidian sublime-text

# OTHER INSTALL SCRIPTS
source ~/Code/My-Debian-System/fonts.sh
source ~/Code/My-Debian-System/coding.sh
source ~/Code/My-Debian-System/publishing.sh
source ~/Code/My-Debian-System/music.sh
source ~/Code/My-Debian-System/gaming.sh

# TODO install Chrysalis
#wget Chrysalis 

sudo reboot now