# Display Manager: ly
sudo apt install -y libpam0g-dev libxcb-xkb-dev
cd 
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
sudo systemctl enable ly.service


# XSessions and dwm.desktop
if [[ ! -d /usr/share/xsessions ]]; then
    sudo mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
EOF
sudo cp ./temp /usr/share/xsessions/dwm.desktop;rm ./temp

# Creating directories
mkdir ~/.config/suckless

sudo apt install -y libx11-dev

# Move install directory, make, and install
cd ~/.config/suckless
tools=( "dwm" "dmenu" "st" "slstatus" "slock" "tabbed" )
for tool in ${tools[@]}
do 
	git clone git://git.suckless.org/$tool
	cd ~/.config/suckless/$tool;make;sudo make clean install;cd ..
done

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
# example if you want to use in autostart located in ~/.local/share/dwm/autostart.sh
# sudo apt install -y feh
sudo apt install -y nitrogen 

# Packages needed dwm after installation
sudo apt install -y picom numlockx rofi dunst libnotify-bin unzip policykit-1-gnome scrot mousepad