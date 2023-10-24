# Display Manager: ly
sudo nala install -y libpam0g-dev libxcb-xkb-dev
cd
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
sudo systemctl enable ly.service

# Window Manger: i3
sudo nala install i3

# TODO enable natural scrolling