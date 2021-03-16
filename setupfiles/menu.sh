#!/bin/bash
#
# Author: @veggietorta
# Update: 03.12.21
# Purpose: Launching point for other installations and configurations


menu_ask_user()
{
    # Log function
    # Promp & read input
    # Load source based on input using if/then statement


    echo $el_day_time ": Enter menu_ask_user" >> $el_log
    clear

    main_menu_input=$(
    whiptail --menu "Select program to setup or modify" 25 65 15 \
        "1)" "zsh and Oh-my-zsh" \
        "2)" "vim or neovim" \
        "3)" "gnome-tweak-tool" \
        "4)" "vifm" \
        "5)" "virtualbox" \
        "6)" "time" \
        "7)" "python3" \
        "8)" "youtube-dl | ytfzf | fzf" \
        "9)" "SSH" \
        "10)" "Wifi" 3>&1 1>&2 2>&3
    )
    # echo 11. Plex
    # echo 12. dmenu
    # echo OS check
    # echo fzf
    # echo foundation


    case $main_menu_input in
        "10)")
            source $HOME/dotfiles/setupfiles/wifi/launch.sh
            ;;
    esac








    if [ -z $main_menu_input ];
        then
            echo "You canceled"
        else
            "something something"
    fi


    # Source SSH file
    if [ $main_menu_input = '9' ];
        then
            echo $el_day_time": Option 9, time file selected" >> $el_log
            . $HOME/dotfiles/setupfiles/ssh
            menu_ssh

    # Source youtube-dl & ytfzf file
    elif [ $main_menu_input = '8' ]
        then
            echo $el_day_time": Option 8, time file selected" >> $el_log
            . $HOME/dotfiles/setupfiles/yt-fzf
            menu_yt-fzf

    # Source wifi file
    elif [ $main_menu_input = '10' ]
        then
            echo $el_day_time": Option 10, time file selected" >> $el_log
            . $HOME/dotfiles/setupfiles/wifi/wifi
            menu_wifi

    # Source time file
    elif [ $main_menu_input = '6' ]
        then
            echo $el_day_time": Option 6, time file selected" >> $el_log
            . $HOME/dotfiles/setupfiles/time
            menu_time

    # Source ZSH file
    elif [ $main_menu_input = '1' ]
        then
            echo $el_day_time": Option 1, Zsh file selected" >> $el_log
            . $HOME/dotfiles/setupfiles/zsh
            menu_zsh

    # Source Vim or Neovim file
    elif [ $main_menu_input = '2' ]
        then
            echo $el_day_time ": Option 2, Vim or Neovim file selected" >> $el_log
            . $HOME/dotfiles/setupfiles/neovim_vim
            menu_neovim

    # Source gnome-tweak-tool file
    elif [ $main_menu_input = '3' ]
        then
            echo $el_day_input ": Option 3, gnome-tweak-tool file selected" >> $el_log
            . $HOME/dotfiles/setupfiles/gnome-tweak-tool
            menu_gtl

    # Source vifm file
    elif [ $main_menu_input = '4' ]
        then
            echo $el_day_time ": Option 4, vifm file selected" >> $el_log
            . $HOME/dotfiles/setupfiles/vifm
            menu_vifm

    # Source virtualbox file
    elif [ $main_menu_input = '5' ]
        then
            echo $el_day_time ": Option 5, virtualbox file selected" >> $el_log
            . $HOME/dotfiles/setupfiles/virtualbox
            menu_virtualbox


    # Source Python3 file
    elif [ $main_menu_input = '7' ]
        then
            echo $el_day_time ": Option 7, virtualbox file selected" >> $el_log
            . $HOME/dotfiles/setupfiles/python3
            menu_python

    # Exit
    elif [ $main_menu_input = 'q' ]
        then
            echo $el_day_time ": Option q, exit selected" >> $el_log
            exit 1

    # Input not received, start over
    else
        #log
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
