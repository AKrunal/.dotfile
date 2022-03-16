#!/usr/bin/env bash

#git init 
selected=`cat ~/.tmux-cht-languages | fzf `
if [[ -z $selected ]]; then
    exit 0
fi
# search if there is folder name in ~/.dotfile/nvim/.config/nvim/local-conf
dict=`find ~/.dotfile/nvim/.config/nvim/local-conf -type d -name "$selected"`
if [  -d "$dict" ]; then
    cp -v "$dict/init.vim" "`pwd`"
    cp -v "$dict/.gitignore" "`pwd`"
fi

