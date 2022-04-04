#!/bin/bash
# Author: Haitham Aouati

# font color
black=$'\e[0;30m'
red=$'\e[0;31m'
green=$'\e[0;32m'
yellow=$'\e[0;33m'
blue=$'\e[0;34m'
purple=$'\e[0;35m'
cyan=$'\e[0;36m'
gray=$'\e[0;90m'
light_green=$'\e[0;92m'
white=$'\e[0;37m'

# text format
reset=$'\e[0m'
bold=$'\e[1m'
faint=$'\e[2m'
italics=$'\e[3m'
underline=$'\e[4m'

# background color
bg_black=$'\e[0;40m'
bg_red=$'\e[0;41m'
bg_green=$'\e[0;42m'

# clear screen
clear

clear

# ascii banner
cat << "EOF"
      .---.
     /     \
     \.@-@./
     /`\_/`\
    //  _  \\ Penguin
   | \     )|_
  /`\_`>  <_/ \
  \__/'---'\__/
EOF

echo -e "$bg_red[!] Under dev [!]\n"

sleep 3

echo -e "$reset Author:$blue Haitham Aouati"
echo -e "$reset Version:$yellow 1.0 $white\n"
echo -e "$reset Repo:$gray https://github.com/haithamaouati/penguin $reset\n"

read -p "Press any key to resume ..."

# Update all installed packages to the latest
pkg update -y

# Upgrade all installed packages to the latest
pkg upgrade -y

# Fast, scalable, distributed revision control system7
pkg install git -y

# Small, free and friendly text editor
pkg install nano -y

# Vi IMproved - enhanced vi editor
pkg install vim -y

# Program for making large letters out of ordinary text
pkg install figlet -y

# FIGlet-compatible display of large colourful characters in text mode
pkg install toilet -y

# Program which generates ASCII pictures of a cow with a message
pkg install cowsay -y

# Simple system information script
pkg install neofetch -y

# Simple yet fancy CPU architecture fetching tool
pkg install cpufetch
# Tools for working with zip files
pkg install zip -y

# Tools for working with zip files
pkg install unzip -y

# Commandline tool for retrieving files using HTTP, HTTPS and FTP
pkg install wget -y

# Command line tool for transferring data with URL syntax
pkg instsll curl

# Package repository containing programs for rooted devices

read -p "Press any key to exit ..."
exit
