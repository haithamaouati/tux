#!/bin/bash
# Author: Haitham Aouati

# Foreground colors
fg_black=$'\e[0;30m'
fg_red=$'\e[0;31m'
fg_green=$'\e[0;32m'
fg_yellow=$'\e[0;33m'
fg_blue=$'\e[0;34m'
fg_purple=$'\e[0;35m'
fg_cyan=$'\e[0;36m'
fg_gray=$'\e[0;90m'

red=$'\e[0;91m'
green=$'\e[0;92m'
yellow=$'\e[0;93m'                                      blue=$'\e[0;94m'
purple=$'\e[0;95m'
cyan=$'\e[0;96m'
white=$'\e[0;37m'

# Background colors
bg_red=$'\e[0;41m'

# ANSI formats
reset=$'\e[0m'
bold=$'\e[1m'
faint=$'\e[2m'
italics=$'\e[3m'
underline=$'\e[4m'

# Check root superuser

if (( $EUID == 0 )); then
    echo "Please do not run as root."
    exit
fi

clear

# Banner

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

# Script info

echo -e "$reset$bold           Tux$reser\n"
echo -e "$reset Author:$fg_blue Haitham Aouati"
echo -e "$reset Version:$fg_yellow 3.0 $white\n"
echo -e "$reset Repo: https://github.com/haithamaouati/tux\n"

un=$(whoami) # User name
hn=$(uname -n) # Host name
echo -e "$green $un$reset@$green$hn"
echo -e "$reset -----------------"
os=$(uname -o) # Operating system
mn=$(uname -m) # Machine name
echo -e "$green OS:$reset $os$fg_yellow $mn"
kn=$(uname -s) # Kernel name
kv=$(uname -v) # Kernel version
kr=$(uname -r) # Kernel release
echo -e "$green Kernel:$reset $kn$fg_yellow $kr"
upt=$(uptime -p)
echo -e "$green Uptime:$reset $upt"
td=$(date)
echo -e "$green Time & date:$reset $td"

# Update packages

function update_packages () {
    echo -e "\n$yellow[*]$reset Updating packages..."
    pkg update -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Packages updated."
    main_menu
}

# Upgrade packages

function upgrade_packages () {
    echo -e "\n$yellow[*]$reset Upgrading packages..."
    pkg upgrade -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Packages upgrated."
    main_menu
}

# Install packages

function install_packages () {
    echo -e "\n$yellow[*]$reset Installing packages...\n"
    pkg install tsu -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green tsu$reset installed."
    pkg install termux-api -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green termux-api$reset installed."
    pkg install termux-auth -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green termux-auth$reset installed."
    pkg install termux-tools -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green termux-tools$reset installed."
    pkg install git -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green git$reset installed."
    pkg install wget -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green wget$reset installed."
    pkg install curl -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green curl$reset installed."
    pkg install nano -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green nano$reset installed."
    pkg install vim -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green vim$reset installed."
    pkg install zip -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green zip$reset installed."
    pkg install unzip -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green unzip$reset installed."
    pkg install unrar -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green unrar$reset installed."
    pkg install figlet -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green figlet$reset installed."
    pkg install neofetch -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green neofetch$reset installed."
    pkg install cpufetch -y > /dev/null 2>&1
    echo -e "$green[✓]$reset Package:$green cpufetch$reset installed."
    echo -e "\n$light_green[✓]$reset Packages installed."
    main_menu
}

# Close script

function close () {
    echo -e "\n$reset Time spend:$green $SECONDS seconds\n"
    exit
}

# Incorrect choice

function error () {
    echo -e "\n$red[!]$reset Option: $fg_blue$choice$reset not exist."
    main_menu
}

# Main menu

function main_menu () {
    echo -e "\nMain menu\n"
    echo -e "$fg_blue 1)$reset Update packages"
    echo -e "$fg_blue 2)$reset Upgrade packages"
    echo -e "$fg_blue 3)$reset Install packages"
    echo -e "$fg_blue 0)$reset Close\n"

    read -p "Choice: " choice;
        case $choice in
            1) update_packages;;
            2) upgrade_packages;;
            3) install_packages;;
            0) close;;
            *) error;;
        esac
}

main_menu
