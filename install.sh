#!/bin/bash

which git > /dev/null 2>&1
if [ $? -ne 0 ]; then
	read -p "Git is not installed. Would you like to install Git [Y/n]? " line < /dev/tty
	case "$line" in
		y|Y) sudo apt-get update && sudo apt-get install -y git-core
			;;
		n|N) echo "Please install Git first" && exit 1
			;;
	esac
fi

dotfiles=$HOME/dotfiles

git clone --recursive https://github.com/IgorTimoshenko/dotfiles.git $dotfiles
cd $dotfiles

read -p "Would you like to bootstrap new system [Y/n]? " line < /dev/tty
case "$line" in
	y|Y) sh $dotfiles/bootstrap-new-system.sh
		;;
esac

sh $dotfiles/symlink-dotfiles.sh
