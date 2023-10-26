# Text Editor: Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo nala install -y sublime-text

# Python distribution: Anaconda
## Dependencies:
sudo nala install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
chmod +x ~/Downloads/Anaconda3-2023.09-0-Linux-x86_64.sh
bash ~/Downloads/Anaconda3-2023.09-0-Linux-x86_64.sh
