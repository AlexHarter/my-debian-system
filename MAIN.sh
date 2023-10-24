#!/bin/bash

# Start here.  Enter these commands:
# sudo apt install git
# mkdir ~/Code
# git clone https://github.com/AlexHarter/My-Debian_system.git
# cd My-Debian-System

# apt frontend: nala
sudo apt install nala

# INCLUDES make, etc.
sudo nala install -y build-essential 

# Microcode for Intel/AMD 
# sudo nala install -y amd64-microcode
sudo nala install -y intel-microcode 

# Network Manager 
sudo nala install -y network-manager-gnome # not sure if I need this

# Command line text editor: vim
sudo nala install -y vim
#sudo nala install -y neovim

## TUI: nnn
sudo nala install -y nnn

# Window Manager: qtile
sudo nala install xserver-xorg xinit
sudo nala install libpangocairo-1.0-0
sudo nala install python3-pip python3-xcffib python3-cairocffi
pip install qtile

# Display Manager: ly
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
make run
make install installsystemd
systemctl enable ly.service

# Terminal

# File Manager: pcmanfm-qt
sudo nala  install -y thunar

# Network File Tools/System Events
#sudo nala install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends xfce4-power-manager timeshift

#sudo systemctl enable avahi-daemon
#sudo systemctl enable acpid

# Audio
sudo nala install -y pipewire-audio

# Neofetch/HTOP
sudo nala install -y neofetch htop

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
sudo nala install -y exa

# Bluetooth
#sudo nala install -y bluez blueman
#sudo systemctl enable bluetooth

# Printing
#sudo nala install -y cups
#sudo systemctl enable cups

# Fonts
sudo apt install fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus 

# Create folders in user directory (eg. Documents, Downloads, etc.)
xdg-user-dirs-update

# Install Nerd Fonts
source ~/Code/My-Debian-System/nerdfonts.sh


# For any installation:

# Install Brave Browser
sudo nala install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser

sudo nala install appimagelauncher

# Obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.16/Obsidian-1.4.16.AppImage
appimagelauncher Obsidian-1.4.16.AppImage

# Torrent Client: qbittorrent
sudo apt install qbittorrent

# Chrysalis for Keyboardio Keyboards
wget https://github.com/keyboardio/Chrysalis/releases/download/v0.13.2/Chrysalis-0.13.2-x64.AppImage
appimagelauncher Chrysalis-0.13.2-x64

source ~/Code/My-Debian-System/coding.sh
source ~/Code/My-Debian-System/publishing.sh
source ~/Code/My-Debian-System/music.sh
source ~/Code/My-Debian-System/gaming.sh

printf "\e[1;32mDone! You can now reboot.\e[0m\n"