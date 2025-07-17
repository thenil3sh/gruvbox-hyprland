#! /bin/bash

SHELL_WIDTH=$(tput cols)
SHELL_HEIGHT=$(tput lines)
# Will I use it? idk

handle_answer () {
    if [[ $1 == "y" || $1 == "Y" ]]; then
        pacman sud;
    else
        echo "No, don't Install Fish!!";
    fi
}



echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~       _   _                   ____                        ~
~      | | | |_   _ _ __  _ __ / ___|_ __ _   ___   __      ~
~      | |_| | | | | '_ \| '__| |  _| '__| | | \ \ / /      ~
~      |  _  | |_| | |_) | |  | |_| | |  | |_| |\ V /       ~
~      |_| |_|\__, | .__/|_|   \____|_|   \__,_| \_/        ~
~             |___/|_|                                      ~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

answer=" "
if  (pacman -Q fish &> /dev/null) || (pacman -Q fish-git &> /dev/null); then
    printf "\e[33mFish (shell) isn't installed,\e[0m\nDo you wish to use it? [y/N] : ";
        read -r answer;
else
    echo "Fish aint here";
fi

if [[ ${answer,,} == "y" || ${answer,,} == "yes" ]]; then
    sudo pacman -S fish --noconfirm;
else
    echo "No fish mate";
fi
