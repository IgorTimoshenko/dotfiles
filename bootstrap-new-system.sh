#!/bin/bash

sudo apt-get update

# git
sudo apt-get install -y git-extras git-flow

# tig
sudo add-apt-repository ppa:aguignard/ppa
sudo apt-get update
sudo apt-get install -y tig

# vim
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev \
    libxpm-dev libxt-dev python-dev ruby-dev mercurial

sudo apt-get remove -y vim vim-runtime gvim vim-tiny vim-common vim-gui-common

cd $HOME
hg clone https://code.google.com/p/vim/
cd vim
./configure --with-features=huge \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --with-python-config-dir=/usr/lib/python2.7-config \
    --enable-perlinterp \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

# youcompleteme
sudo apt-get install -y build-essential cmake python-dev
cd $HOME/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh

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
mkdir -p $HOME/.fonts && mv PowerlineSymbols.otf $HOME/.fonts
fc-cache -vf $HOME/.fonts

wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p $HOME/.config/fontconfig/conf.d && mv 10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d
