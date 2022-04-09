#!/bin/bash
# Author: Haitham Aouati

# text color
black=$'\e[0;30m'
red=$'\e[0;31m'
green=$'\e[0;32m'
yellow=$'\e[0;33m'
blue=$'\e[0;34m'
purple=$'\e[0;35m'
cyan=$'\e[0;36m'
gray=$'\e[0;90m'
light_red=$'\e[0;91m'
light_green=$'\e[0;92m'
light_yellow=$'\e[0;93m'
light_blue=$'\e[0;94m'
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

# alias
alias penguin='bash penguin.sh'

# change directory to home
cd ~

# clear screen
clear

# ascii banner
cat << "EOF"
          .---.
         /     \
         \.@-@./
         /`\_/`\
        //  _  \\
       | \     )|_
      /`\_`>  <_/ \
      \__/'---'\__/
EOF

if [[ $(id -u) -ne 0 ]] ; then echo -e "$bg_red[!] Please run as root [!]" ; fi
echo -e "$reset$bold         Penguin$reset"
echo -e "All packages in one script\n"
sleep 3
echo -e "$reset Author:$blue Haitham Aouati"
echo -e "$reset Version:$light_yellow 1.1 $white\n"
echo -e "$reset Repo: https://github.com/haithamaouati/penguin\n"

un=$(whoami) # User name
hn=$(uname -n) # Host name
echo -e "$light_green $un$reset@$light_green$hn"
echo -e "$reset -----------------"
os=$(uname -o) # Operating system
mn=$(uname -m) # Machine name
echo -e "$light_green OS:$reset $os$yellow $mn"
kn=$(uname -s) # Kernel name
kv=$(uname -v) # Kernel version
kr=$(uname -r) # Kernel release
echo -e "$light_green Kernel:$reset $kn$yellow $kr"
upt=$(uptime -p)
echo -e "$light_green Uptime:$reset $upt"
td=$(date)
echo -e "$light_green Time & date:$reset $td\n"

func_update ()
{
echo -e "\n$light_green[*]$reset Updating packages...\n"
# Update all installed packages to the latest
pkg update -yy
echo -e "\n$light_green[✓]$reset Packages updated."
exit
}

func_upgrade ()
{
echo -e "\n$light_green[*]$reset Upgrading packages...\n"
# Upgrade all installed packages to the latest
pkg upgrade -yy
echo -e "\n$light_green[✓]$reset Packages upgrated."
exit
}

func_permission ()
{
echo -e "\n$light_green[*]$reset Allowing permissions...\n"
sdir=storage
if [ -d $sdir ]; then
echo -e "$light_red[X]$reset $sdir is already exist."
else
cd ~
termux-setup-storage
echo -e "$light_green[✓]$reset $sdir created."
fi
echo -e "$light_green[✓]$reset Allowed permissions.\n"
pwd
ls
exit
}

func_install ()
{
echo -e "\n$light_green[*]$reset Installing packages...\n"
# passwd
pkg install termux-auth -yy

# proot
pkg install proot -yy

# Ncurses utils
pkg install ncurses-utils -yy

# Fast, scalable, distributed revision control system7
pkg install git -yy

# Small, free and friendly text editor
pkg install nano -yy

# Vi IMproved - enhanced vi editor
pkg install vim -yy

# Program for making large letters out of ordinary text
pkg install figlet -yy

# FIGlet-compatible display of large colourful characters in text mode
pkg install toilet -yy

# Program which generates ASCII pictures of a cow with a message
pkg install cowsay -yy

# Simple system information script
pkg install neofetch -yy

# Simple yet fancy CPU architecture fetching tool
pkg install cpufetch

# A command-line Git information tool written in Rust
pkg install onefetch -yy

# Tools for working with zip files
pkg install zip -yy

# Tools for working with zip files
pkg install unzip -yy

# Commandline tool for retrieving files using HTTP, HTTPS and FTP
pkg install wget -yy

# Command line tool for transferring data with URL syntax
pkg install curl -yy

#
pkg install openssh -yy

# python
pkg install python -yy

# pip
pkg install pip -yy

echo -e "\n$light_green[✓]$reset Packages installed."
echo -e "\n$light_green[*]$reset Subscribing to additional repositories:\n"
# Package repository containing programs for rooted devices
pkg install root-repo -yy
echo -e "\n$light_green[✓]$reset Done.\n"
pip install bs4
pip install requests
pip install mechanize
pip install colorama
pip install futures
exit
}

func_clone ()
{
echo -e "\n$light_green[*]$reset Cloning repositories...\n"
# git clone
echo -e "\n$light_green[✓]$reset Repositories cloned."
exit
}

func_close ()
{
echo -e "\n$light_green[*]$reset Closing...$reset"
figlet Penguin
echo -e "$bg_red[!]       Under development       [!]$reset"
echo -e "\n$reset Time spend:$light_green $SECONDS seconds\n"
echo -e "$light_red[X]$reset Closed.$reset\n"
exit
}

func_error ()
{
echo -e "\n$red[!]$reset Not a valid choice.\n"
}

echo -e "$light_yellow 1)$reset Update Packages"
echo -e "$light_yellow 2)$reset Upgrade Packages"
echo -e "$light_yellow 3)$reset Allow Permissions"
echo -e "$light_yellow 4)$reset Install Packages"
echo -e "$light_yellow 5)$reset Clone Repositories"
echo -e "$light_yellow 0)$reset Exit\n"

read -p "#? " -e -n 1 -s choice;
    case "$choice" in
            1) func_update;;
            2) func_upgrade;;
            3) func_permission;;
            4) func_install;;
            5) func_clone;;
            0) func_close;;
            *) func_error;;
    esac
