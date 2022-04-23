#!/bin/bash
# Author: Haitham Aouati
# Lastest update: 23 April, 2022

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
light_purple=$'\e[0;95m'
light_cyan=$'\e[0;96m'
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

alias tux="bash tux.sh"

if (( $EUID == 0 )); then
    echo "Please do not run as root"
    exit
fi

clear

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

echo -e "$reset$bold           Tux$reset"
echo -e "All packages in one script\n"
echo -e "$reset Author:$blue Haitham Aouati"
echo -e "$reset Version:$light_yellow 2.1 $white\n"
echo -e "$reset Repo: https://github.com/haithamaouati/tux\n"

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

function update () {
    echo -e "\n$blue[*]$reset Updating packages..."
    pkg update -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset Packages updated.\n"
    exit
}

function upgrade () {
    echo -e "\n$blue[*]$reset Upgrading packages..."
    pkg upgrade -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset Packages upgrated.\n"
    exit
}

function setup () {
    echo -e "\n$blue[*]$reset Setup storage..."
    if [[ -d storage ]] ; then
        echo -e "$light_yellow[!]$reset storage alredy exist.\n"
    else
        termux-setup-storage
        echo -e "$light_green[✓]$reset Done.\n"
        exit
    fi
}

function install () {
    echo -e "\n$blue[*]$reset Installing packages...\n"
    pkg install termux-auth -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset termux-auth"
    pkg install tsu -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset tsu"
    pkg install termux-api -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset termux-api"
    pkg install git -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset git"
    pkg install nano -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset nano"
    pkg install vim -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset vim"
    pkg install neofetch -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset neofetch"
    pkg install cpufetch -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset cpufetch"
    pkg install figlet -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset figlet"
    pkg install zip -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset zip"
    pkg install unzip -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset unzip"
    pkg install unrar -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset unrar"
    pkg install openssh -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset openssh"
    pkg install wget -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset wget"
    pkg install curl -yy > /dev/null 2>&1
    echo -e "$light_green[✓]$reset curl"
    echo -e "\n$light_green[✓]$reset Packages installed.\n"
    exit
}

function latest () {
    echo -e "$light_green[*]$reset Updating repository..."
    git pull https://github.com/haithamaouati/tux > /dev/null 2>&1
    echo -e "$light_green[✓]$reset Repository updated.\n"
}

function close () {
    echo -e "\n$reset Time spend:$light_green $SECONDS seconds\n"
    exit
}

echo -e "$light_yellow 1)$reset Update Packages"
echo -e "$light_yellow 2)$reset Upgrade Packages"
echo -e "$light_yellow 3)$reset Install Packages"
echo -e "$light_yellow 4)$reset Setup Storage"
echo -e "$light_yellow 5)$reset Update Repo"
echo -e "$light_yellow 0)$reset Exit\n"

read -p "#? " choice;
    case "$choice" in
            1) update;;
            2) upgrade;;
            3) install;;
            4) setup;;
            5) latest;;
            0) close;;
            *) echo -e "\n$red[!]$reset Not a valid choice.\n";;
    esac
