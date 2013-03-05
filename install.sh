#!/bin/bash
if [ -f ~/.bashrc ];then
    mv ~/.bashrc ~/.bashrc.bak
fi
ln -s bashrc ~/.bashrc
if [ -f ~/.gitconfig ];then
    mv ~/.gitconfig ~/.gitconfig.bak
fi
ln -s gitconfig ~/.gitconfig
cd awesome
./install.sh
cd ..
if [ -d ~/.config/awesome ];then
    mv ~/.config/awesome ~/.config/awesome_bak
fi
git submodule foreach git submodule update
vim/install.sh
