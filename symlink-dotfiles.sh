#!/bin/bash

dotfiles=$HOME/dotfiles

link() {
    from=$1
    to=$2
    rm -f "$to"
    ln -s "$from" "$to"
}

for location in $(find home -maxdepth 1 -name '.*'); do
    file="${location##*/}"
    link $dotfiles/$location ~/$file
done
