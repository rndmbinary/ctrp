#!/bin/sh


# Install lots of wares
sudo apt-get install -y snapd neovim zsh git yara radare2 python3-pip p7zip-full less volatility tcpdump lynx host w3m libimage-exiftool-perl software-properties-common ranger whois bind9-host nodejs xpdf libemail-outlook-message-perl
sudo snap install powershell --classic
sudo curl -L https://www.npmjs.com/install.sh | sh
sudo npm install typescript
sudo pip3 install yara r2pipe requests scapy bs4 oletools pdfminer.six shodan

# Install terminal customization
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone git@github:janjoswig/Ducula.git ${ZSH_CUSTOM}/themes/Ducula
sudo sed -i 's/ZSH_THEME\="\w+"/ZSH_THEME\="Ducula\/ducula"/' ~/.zshrc
sudo sed -i 's/plugins\=\(git\)/plugins\=(git git-prompt command-not-found common-aliases encode64 history urltools\)/' ~/.zshrc
sudo chown $USER ~/.zsh_history
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/nvim
source ~/.config/nvim/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.zshrc

# Install sleuthkit
wget https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-4.7.0/sleuthkit-4.7.0.tar.gz
7z x sleuthkit-4.7.0.tar.gz -r

# Install open source tools
mkdir git
git clone https://github.com/ReFirmLabs/binwalk.git ~/git/binwalk
git clone https://github.com/mattgwwalker/msg-extractor.git ~/git/msg-extractor
git clone https://github.com/laramies/theHarvester.git ~/git/theHarvester
git clone https://github.com/pwndbg/pwndbg.git ~/git/pwndbg

# Install osquery
export OSQUERY_KEY=1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $OSQUERY_KEY
sudo add-apt-repository 'deb [arch=amd64] https://pkg.osquery.io/deb deb main'
sudo apt-get update
sudo apt-get install osquery
