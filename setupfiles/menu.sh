#!/bin/bash
# Author: @veggietorta
# Update: 02.14.21

. $HOME/dotfiles/setupfiles/logging_script

menu_ask_user()
{
    # Log function
    # Promp & read input
    # Load source based on input using If/then statement

    echo $el_day_tim ": enter menu_ask_user" >> $el_log
    clear
    echo "Select program to setup or modify:\n"
    echo 1. zsh and Oh-my-zsh
    echo 2. neovim

    echo "q. exit"

    read main_menu_input

    # Source ZSH file
    if [ $main_menu_input = '1' ]
    then
        . $HOME/dotfiles/setupfiles/zsh
        echo $el_day_time ": sourced zsh file" >> $el_log
        menu_zsh


    # Source Neovim file
    elif [ $main_menu_input = '2' ]
    then
        . $HOME/dotfiles/setupfiles/neovim
        echo $el_day_time ": sourced neovim file" >> $el_log
        menu_neovim


    # Exit
    elif [ $main_menu_input = 'q' ]
    then
        exit 1


    else
        echo $el_day_time ": Input not understood sent back to menu_ask_user" >> $el_log
        menu_ask_user
    fi

}


log_it_up
