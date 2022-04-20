#!/bin/bash                                             # Author: Haitham Aouati
# Lastest update: 20/04/2022
                                                                             # text color                                            black=$'\e[0;30m'                                       red=$'\e[0;31m'
green=$'\e[0;32m'
yellow=$'\e[0;33m'                                      blue=$'\e[0;34m'
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

alias setup="bash seutp.sh"

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

echo -e "$reset$bold         Penguin$reset"
echo -e "All packages in one script\n"
sleep 3
echo -e "$reset Author:$blue Haitham Aouati"
echo -e "$reset Version:$light_yellow 1.4 $white\n"
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

function update () {
    echo -e "\n$light_green[*]$reset Updating packages...\n"
    sleep 3
    pkg update -yy
    echo -e "\n$light_green[✓]$reset Packages updated."
    exit
}

function upgrade () {
    echo -e "\n$light_green[*]$reset Upgrading packages...\n"
    sleep 3
    pkg upgrade -yy
    echo -e "\n$light_green[✓]$reset Packages upgrated."
    exit
}

function setup () {
    echo -e "\n$light_green[*]$reset Setup storage..."
    sleep 3
    echo -e "$light_green[*]$reset Allowing permissions...\n"
    if [[ -d storage ]] ; then
        ls -d storage
        echo -e "\n$light_yellow[!]$reset Permissions already present.\n"
    else
        termux-setup-storage
        ls -d storage
        echo -e "\n$light_green[✓]$reset Permissions Allowed.\n"
        exit
    fi
}

function install () {
    echo -e "\n$light_green[*]$reset Installing packages...\n"
    sleep 3
    pkg install termux-auth -yy
    pkg install tsu -yy
    pkg install termux-api -yy
    pkg install git -yy
    pkg install nano -yy
    pkg install vim -yy
    pkg install neofetch -yy
    pkg install cpufetch -yy
    pkg install figlet -yy
    pkg install zip -yy
    pkg install unzip -yy
    pkg install unrar -yy
    pkg install openssh -yy
    pkg install wget -yy    pkg install curl -yy
    echo -e "\n$light_green[✓]$reset Packages installed."
    exit
}

function check () {
    echo -e "\n$light_green[*]$reset Checking root...\n"
    sleep 3
    if (( $EUID == 0 )); then
        echo -e "$light_green[✓]$reset You are root.\n"
    else
        echo -e "$light_red[×]$reset You are not root.\n"
    fi
}

function uprepo () {
    echo -e "\n$light_green[*]$reset Checking updates..."
    sleep 3
    echo -e "$light_green[*]$reset Updating repo...\n"
    sleep 3
    git pull https://github.com/haithamaouati/penguin
    echo -e "\n$light_green[✓]$reset Repository updated.\n"
}

function close () {
    echo -e "\n$reset Time spend:$light_green $SECONDS seconds\n"
    exit
}

echo -e "$light_yellow 1)$reset Update Packages"
echo -e "$light_yellow 2)$reset Upgrade Packages"
echo -e "$light_yellow 3)$reset Install Packages"
echo -e "$light_yellow 4)$reset Setup Storage"
echo -e "$light_yellow 5)$reset Check Root"
echo -e "$light_yellow 6)$reset Update Repo"
echo -e "$light_yellow 0)$reset Exit\n"

read -p "#? " -e -n 1 -s choice;
    case "$choice" in
            1) update;;
            2) upgrade;;
            3) install;;
            4) setup;;
            5) check;;
            6) uprepo;;
            0) close;;
            *) echo -e "\n$red[!]$reset Not a valid choice.\n";;
    esac
