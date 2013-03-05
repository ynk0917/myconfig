#!/bin/bash
current_directory=`pwd`
if [ -f ~/.bashrc ];then
    mv ~/.bashrc ~/.bashrc.bak
    rm ~/.bashrc
fi
ln -s $current_directory/bashrc ~/.bashrc
if [ -f ~/.gitconfig ];then
    mv ~/.gitconfig ~/.gitconfig.bak
    rm ~/.gitconfig
fi
ln -s $current_directory/gitconfig ~/.gitconfig
if [ -d ~/.config/awesome ];then
    mv ~/.config/awesome ~/.config/awesome_bak
fi
ln -s $current_directory/awesome ~/.config/awesome
git submodule init
git submodule update
git submodule foreach git submodule update
git submodule foreach git submodule update
vim/install.sh
