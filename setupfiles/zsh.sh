#!/bin/bash
# Author: veggietorta
# Update: 01.15.21

zsh_install()
{
    # Log entrance into 'zsh_install'
    echo "Entered zsh_install: " $el_day_time >> $el_log

    # Promp for action
    clear
    echo "Would you like to:\n"
    echo "1. Install zsh & oh-my-zsh"
    echo "2. Symbolic-link custom .zshrc"
    echo "3. Return to main menu"

    read zsh_user_input

    if [ $zsh_user_input = "1" ];
    then
        # Log input received as '1'
        echo "User input received as 'Install zsh & oh-my-zsh' " $el_day_time >> $el_log

        # Remove any existing .zshrc file in $HOME directory and redirects output "2>&1", should .zshrc file doesn't exist
        # Install ZSH and '-y' approves any prompts
        # Install Oh-my-Zsh
        # Write to log
        # Send bach to ask_user
        rm $HOME/.zshrc 2>&1
        sudo apt install zsh -y
        clear
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        menu_ask_user

    elif [ $zsh_user_input = "2" ];
    then
        # Log input received as '2'
        echo "User input received as 'Symbolic-link custom .zshrc: " $el_day_time >> $el_log

        # Remove any lingering .zshrc file and redirects output if a .zshrc file does not exist
        # Establish symbolic link
        # Sends user to main menu
        rm $HOME/.zshrc 2>&1
        ln -s $HOME/dotfiles/configs/zsh/ubuntu/.zshrc $HOME/
        clear
        menu_ask_user

    elif [ $zsh_user_input = "3" ];
    then
        # Return to menu
        clear
        menu_ask_user

    else
        # Send back to menu
        clear
        menu_ask_user
    fi
}

