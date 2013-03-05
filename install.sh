#!/bin/bash
current_directory=`pwd`
if [ -f ~/.bashrc ];then
    mv ~/.bashrc ~/.bashrc.bak
fi
ln -s $current_directory/bashrc ~/.bashrc
if [ -f ~/.gitconfig ];then
    mv ~/.gitconfig ~/.gitconfig.bak
fi
ln -s $current_directory/gitconfig ~/.gitconfig
cd awesome
./install.sh
cd ..
if [ -d ~/.config/awesome ];then
    mv ~/.config/awesome ~/.config/awesome_bak
fi
git submodule init
git submodule update
git submodule foreach git submodule update
git submodule foreach git submodule update
vim/install.sh
