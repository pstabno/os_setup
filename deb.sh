#!/bin/bash

#Setup proxy 
#echo "http_proxy=http://172.25.96.246:81">>/etc/environment
#echo "https_proxy=http://172.25.96.246:81">>/etc/environment
#echo "ftp_proxy=http://172.25.96.246:81">>/etc/environment
#echo "socks_proxy=http://172.25.96.246:81">>/etc/environment

#Add official repositories
echo "deb http://ftp.pl.debian.org/debian/ jessie main">>/etc/apt/sources.list
echo "deb-src http://ftp.pl.debian.org/debian/ jessie main">>/etc/apt/sources.list
echo "deb http://ftp.pl.debian.org/debian/ jessie-updates main">>/etc/apt/sources.list
echo "deb-src http://ftp.pl.debian.org/debian/ jessie-updates main">>/etc/apt/sources.list


#Update repository DB and upgrade already installed packages
apt-get update
apt-get upgrade --assume-yes

#Install needed basic software
apt-get install tcpdump zsh mc git vim vim-nox python2.7 python3 tmux make cmake build-essential python-dev --assume-yes

#add proper config files
cp .vimrc .tmux.conf .zshrc ~/

#Set default shell for ZSH
chsh -s /bin/zsh

#Basic git configuration
git config --global user.name "dev"
#git config --global user.email "jenkins.ci@ts.fujitsu.com"

#Setup vim for work with python
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +q +q
cd ~/.vim/bundle/YouCompleteMe && python install.py
