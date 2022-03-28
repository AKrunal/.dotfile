#!/usr/bin/env bash

selected=`cat ~/.tmux-cht-languages | fzf `
if [[ -z $selected ]]; then
    exit 0
fi
# search if there is folder name in ~/.dotfile/nvim/.config/nvim/local-conf
echo "Enter the project name: "
read project_name

# if selected is empty, exit
if [[ -z $project_name ]]; then
    exit 0
fi
# if selected is golang then run 'go mod init $project_name'
if [[ $selected == "golang" ]]; then
    go mod init $project_name
fi

dict=`find ~/.dotfile/nvim/.config/nvim/local-conf -type d -name "$selected"`
if [  -d "$dict" ]; then
    git init 
    cp  "$dict/init.vim" "`pwd`"
    cp  "$dict/.gitignore" "`pwd`"
    echo 'let g:project_name="'${project_name}'"' >> 'init.vim'
fi

