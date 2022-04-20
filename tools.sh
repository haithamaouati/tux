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
bg_green=$'\e[0;42m

echo -e "Tools"

function close () {
    echo -e "\n$reset Time spend:$light_green $SECONDS seconds\n"
    exit
}

echo -e "$light_yellow 1)$reset Section 1"
echo -e "$light_yellow 2)$reset Section 2"
echo -e "$light_yellow 3)$reset Section 3"
echo -e "$light_yellow 4)$reset Section 4"
echo -e "$light_yellow 5)$reset Section 5"
echo -e "$light_yellow 6)$reset Section 6"
echo -e "$light_yellow 0)$reset Exit\n"

read -p "#? " -e -n 1 -s choice;
    case "$choice" in
            1) close;;
            2) close;;
            3) close;;
            4) close;;
            5) close;;
            6) close;;
            0) close;;
            *) echo -e "\n$red[!]$reset Not a valid choice.\n";;
    esac
