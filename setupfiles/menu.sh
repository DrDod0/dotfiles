#!/bin/bash
# Author: @veggietorta
# Update: 02.14.21
# Purpose: Launching point for other installations and configurations


menu_ask_user()
{
    # Log function
    # Promp & read input
    # Load source based on input using if/then statement

    echo $el_day_time ": Enter menu_ask_user" >> $el_log
    clear

    echo "Select program to setup or modify:\n"
    echo "1. zsh and Oh-my-zsh"
    echo "2. neovim"
    echo "3. gnome-tweak-tool"
    echo "4. vifm\n"
    echo "q. exit"

    read main_menu_input


    # Source ZSH file
    if [ $main_menu_input = '1' ]
    then
        echo $el_day_time": Option 1, Zsh file selected" >> $el_log
        . $HOME/dotfiles/setupfiles/zsh
        menu_zsh


    # Source Neovim file
    elif [ $main_menu_input = '2' ]
    then
        echo $el_day_time ": Option 2, Neovim file selected" >> $el_log
        . $HOME/dotfiles/setupfiles/neovim
        menu_neovim


    # Source gnome-tweak-tool
    elif [ $main_menu_input = '3' ]
    then
        echo $el_day_input ": Option 3, gnome-tweak-tool file selected" >> $el_log
        . $HOME/dotfiles/setupfiles/gnome-tweak-tool
        menu_gtl


    # Source vifm
    elif [ $main_menu_input = '4' ]
    then
        echo $el_day_time ": Option 4, vifm file selected" >> $el_log
        . $HOME/dotfiles/setupfiles/vifm
        menu_vifm


    # Exit
    elif [ $main_menu_input = 'q' ]
    then
        echo $el_day_time ": Option q, exit selected" >> $el_log
        exit 1


    else
        echo $el_day_time ": Input not understood sent back to menu_ask_user" >> $el_log
        menu_ask_user
    fi

}

logger()
{
    # Source logging_script
    . $HOME/dotfiles/setupfiles/logging_script

    # Launch function log_it_up from logging_script
    log_it_up
}

logger
