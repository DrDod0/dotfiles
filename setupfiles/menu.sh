#!/bin/bash # Author: @veggietorta
# Update: 01.15.21


# Date and Time variable to be used in loggin actions
el_day_time=$(date)


# Establish log file
log_it_up()
{
    # Assign variable to file
    el_log="/home/vt/dotfiles/setupfiles/log"

    # Look for assigned varible 'el_log' using if/then statement
    # If variable found create new line in 'log' and send to 'menu_ask_user'
    # If variable not found create file name 'log' and send to 'menu_ask_user'
    if [ -f "$el_log" ]
    then
        echo "---" >> $el_log
        menu_ask_user
    else
        touch $el_log
        echo "Created: " $el_day_time >> $el_log
        menu_ask_user
    fi
}


menu_ask_user()
{
    # Log function
    # Promp & read input
    # Load source based on input using If/then statement

    echo "enter menu_ask_user: " $el_day_time >> $el_log
    clear
    echo "Select program to setup or modify:\n"
    echo 1. zsh and Oh-my-zsh
    echo 2. vim

    read main_menu_input

    # Source ZSH file
    if [ $main_menu_input = '1' ]
    then
        . /home/vt/dotfiles/setupfiles/zsh.sh
        echo "sourced zsh.sh file: " $el_day_time >> $el_log
        zsh_install


    # Source
    elif [ $main_menu_input = '2' ]
    then
        echo "hello"
        echo "sourced xxxxxx file: " $el_day_time >> $el_log

    else
        echo "Input not understood sent back to menu_ask_user: " $el_day_time >> $el_log
        menu_ask_user
    fi
}


log_it_up
