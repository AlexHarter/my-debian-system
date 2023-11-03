#!/bin/bash

# Start here.  Enter these commands:
# su
# apt install -y nala git
# mkdir /tmp
# cd /tmp
# git clone https://github.com/AlexHarter/my-debian-system
# cd my-debian-system
# bash alex-install.sh

# APT INSTALLATIONS
# Desktop Environment: XFCE
# Window Manager: i3
# Launcher: rofi
# File Manager: nnn
# Audio: pipewire
# Torrent Client: qbittorrent
nala install -y doas fish network-manager vim nnn flatpak xfce4 xfce4-goodies i3 rofi pipewire-audio qbittorrent fonts-havana frescobaldi lilypond texlive-base texlive-music milkytracker scribus

# FLATPAK INSTALLATIONS
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Discord
# Obsidian
# MuseScore
# Steam
# Prismlauncher
flatpak install flathub discord obsidian musescore lyx steam prismlauncher

# OTHER INSTALLATIONS
# ly
# Brave
# Sublime Text
# Anaconda
# Renoise
# Chrysalis
git clone --recurse-submodules https://github.com/fairyglade/ly

apt install curl
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get install sublime-text

wget -P ~/Downloads Anaconda
wget -P ~/Music Renoise
wget -P ~/Downloads Chrysalis

# CONFIGURATION
# TODO enable natural scrolling

# remove unnecessary software
nala uninstall -y lxdm mousepad

# doas
echo "permit alex as root" | tee /etc/doas.conf

# ly
cd /tmp/ly
make
make install installsystemd
systemctl enable ly.service

# fish
su alex
cd ~
chsh -s /usr/bin/fish

# TODO replace default i3 config with my own

systemctl --user enable wireplumber

systemctl reboot
