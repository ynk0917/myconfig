#!/bin/bash
current_directory=`pwd`
rm ~/.bashrc
rm ~/.zshrc
rm ~/.srceenrc
ln -s $current_directory/bashrc ~/.bashrc
ln -s $current_directory/zshrc ~/.zshrc
ln -s $current_directory/screenrc ~/.screenrc
rm ~/.gitconfig
ln -s $current_directory/gitconfig ~/.gitconfig
rm ~/.tmux.conf
ln -s $current_directory/tmux.conf ~/.tmux.conf
if [ -d ~/.config/awesome ];then
    rm -rf ~/.config/awesome_bak
    mv ~/.config/awesome ~/.config/awesome_bak
fi
ln -s $current_directory/awesome ~/.config/awesome
git pull origin master
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
cd vim
./install.sh
cd ..
