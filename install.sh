#!/bin/bash

dotfiles=~/dotfiles

git clone --recursive https://github.com/IgorTimoshenko/dotfiles.git $dotfiles
cd $dotfiles

echo -n "Would you like to bootstrap new system [Y/n]? "

read item
case "$item" in
    y|Y) sh $dotfiles/bootstrap-new-system.sh
        ;;
esac

sh $dotfiles/symlink-dotfiles.sh
