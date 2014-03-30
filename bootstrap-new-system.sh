#!/bin/bash

sudo apt-get update

# common
sudo apt-get install -y git-extras
sudo apt-get install -y git-flow

sudo add-apt-repository ppa:aguignard/ppa
sudo apt-get update
sudo apt-get install -y tig

sudo apt-get install -y vim

# zsh
sudo apt-get install -y zsh
chsh -s /bin/zsh

# oh-my-zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

# powerline
sudo apt-get install -y python-pip git
pip install --user git+git://github.com/Lokaltog/powerline

cat << EOF > $HOME/.profile
if [ -d "\$HOME/.local/bin" ]; then
    PATH="\$HOME/.local/bin:\$PATH"
fi
EOF

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
mkdir -p $HOME/.fonts/ && mv PowerlineSymbols.otf $HOME/.fonts/
fc-cache -vf $HOME/.fonts/

wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p $HOME/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d/
