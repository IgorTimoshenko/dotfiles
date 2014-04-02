#!/bin/bash

dotfiles=$HOME/dotfiles

cd $dotfiles

echo -n "Would you like to bootstrap new system [Y/n]? "
read line
case "$line" in
	y|Y) sh $dotfiles/bootstrap-new-system.sh
		;;
esac

sh $dotfiles/symlink-dotfiles.sh
