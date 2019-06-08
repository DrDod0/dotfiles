#!/bin/bash
# Author: veggietorta
# Update: 06.08.19
# Puporse: Automate a consistent configuration across rigs

##############################################################

### Act on users OS

    #user_OS_profile()
        #{

    # Reason: Promp system with 'uname' to provide name of OS. Write uname output to file name tmp_os. File tmp_os
    #         is then compared to variables which have been assigned to Ubuntu and OSX.

        # OS name to tmp_os:
            #uname > ~/notes/code/project.dotfiles/tmp_os

        # Assign varible to content of tmp_os
            #os_readout=$(cat ~/notes/code/project.dotfiles/tmp_os)

        # OS Variables:
            #os_ubuntu="Linux"
            #os_osx="Darwin"


    ### Identify Users OS and assign path based on OS

        # Identify OS
         #if [ $os_readout = $os_ubuntu ]
         #then
         #    ubuntu_path=~/dotfiles/ubuntu/
         #    echo "What's up Linux motherfucker"
         #    ask_user


         #elif [ $os_readout = $os_osx ]
         #then
         #    osx_path=~/dotfiles/osx/
         #    echo "What's up OSX motherfucker"
         #    ask_user
         #fi

        # Delete tmp_os file, plain O'clean-up
         #rm ~/notes/code/project.dotfiles/tmp_os
        #}


### Act on users SHELL

        # users '$SHELL' written to tmp_shell file
            #echo $SHELL > ~/notes/code/project.dotfiles/tmp_shell

        # variable assigned to shell, to be used in if/then statement
                #shell_zsh="/usr/bin/zsh"
                #shell_bash="PATH HERE"

        # read and assign variable 'shell_readout' to shell read out to compare with variable in if/then below
        #shell_readout=$(cat ~/notes/code/project.dotfiles/tmp_shell)


        # if/then to compare variable with shell
            #if [ $shell_zsh = $shell_readout ]
            #then echo ZSH is recognized as your shell, configuration file in default location established.
            #    #ln -s ~/dotfiles/ ~/
            #else echo you do not have zsh
            #fi

        # delete tmp file
            #rm ~/notes/code/project.dotfiles/tmp_shell


###############################################################

#dotfile_location()
#    {
#
#    echo "Please enter the path to your configuration files, do NOT end with a '/' (~/dotfiles/shared):"
#    read dotfile_path
#
#    }

ask_user()
    {

    clear
    echo "Which configuration would you like to establish:
                 a. alias
                 b. help
                 e. essential_links

                 1. zsh
                 2. bash
                 3. git
                 4. neofetch
                 5. ranger
                 6. newsboat
                 7. neomutt
                 8. tmux
                 9. neovim
                10. vim
                11. remove_all
                12. sqlite
                13. irssi
            "

            read configuration_answer

            case "$configuration_answer" in

                1) zsh_link;;
                2) bash_link;;
                3) git_link;;
                4) neofetch_link;;
                5) ranger_link;;
                6) newsboat_link;;
                7) neomutt;;
                8) tmux_link;;
                9) neovim_link;;
                10) vim_link;;
                12) remove_all;;
                13) irssi_link;;

                a) alias_link;;
                b) help_link;;
                e) essential_links;;
            esac
        }


#########################################################################

# Remove existing directory and configs
rm_all()
    {

    # bashrc
    rm -rf $HOME/.bashrc 2>/dev/null

    # vim plugins
    rm -rf $HOME/.vim/bundle/ 2>/dev/null

    # ranger
    rm -rf $HOME/.config/ranger/ 2>/dev/null

    # neovim
    rm -rf $HOME/.config/nvim/ 2>/dev/null

    # neofetch
    rm -rf $HOME/.config/neofetch/ 2>/dev/null

    # newsboat
    rm -rf $HOME/.config/newsboat/urls 2>/dev/null
    rm -rf $HOME/.config/newsboat/config 2>/dev/null

    # tmux
    rm -rf $HOME/.tmux.conf 2>/dev/null

    # neomutt
    rm -rf $HOME/.neomuttrc 2>/dev/null

    ask_user
    }

# bash
bash_link()
    {
        if [ -x "$(command -v bash)" ]
        then
            ln -s ~/dotfiles/shared/bash/.bashrc ~/
            echo bash program found, created symbolick link
        else
            echo bash program NOT found, no action taken
            ask_user
        fi
    }

# zsh
zsh_link()
 {
     if [ -x "$(command -v zsh)" ]
     then
         ln -s ~/dotfiles/shared/zsh/.zshrc ~/
         echo zsh program found, created symbolic link
     else
        echo zsh program NOT found, no action taken.
        ask_user
    fi
    }

# vim
vim_link()
    {
        # check for program of vim
    if [ -x "$(command -v nvim)" ]
    then
        # vim program found, symbolic link established, send back to user
        ln -s ~/dotfiles/shared/vim/.vimrc ~/
        echo vim program found, created symbolic link.
        ask_user
    else
        # vim program NOT found, no action taken, send back to user
        echo vim program NOT installed, no action taken.
        ask_user
    fi
    }

# neovim
neovim_link()
    {
        # check for program neovim
    if [ -x "$(command -v nvim)" ]
    then
         # create nvim directory
         mkdir ~/.config/nvim/
         # neovim program found, symbolic link established, send back to user
         ln -s ~/dotfiles/shared/neovim/init.vim ~/.config/nvim/
         echo neovim program found, created symbolic link.
         ask_user
     else
         # neovim program NOT found, no action taken, send back to user
         echo neovim program NOT installed, no action taken.
         ask_user
     fi
    }

# tmux
tmux_link()
    {
    if [ -x "$(command -v tmux)" ]
    then
        ln -s $HOME/dotfiles/shared/tmux/.tmux.conf $HOME/
        echo tmux found, symbolic link established.
    else
        echo tmux not found, no action taken.
    fi
    ask_user
    }

# neomutt
neomuttrc_link()
    {
    if [ -x "$(command -v mutt)" ]
    then
        ln -s ~/dotfiles/shared/neomutt/.neomuttrc ~/
        echo mutt found, symbolic link established
    else
        echo mutt not found, no action taken.
    fi
    ask_user
    }

# newsboat
newsboat_link()
    {
    if [ -x "$(command -v newsboat)" ]
    then
        ln -s ~/dotfiles/shared/newsboat/config ~/.config/newsboat/
        echo newsboat found, .config symbolic link established

        ln -s ~/dotfiles/shared/newsboat/urls ~/.config/newsboat/
        echo newsboat urls sybolic link for established.

    else
        echo newsboat not found, no action taken.

    ask_user
    fi
    }

# ranger
ranger_link()
    {
    if [ -x "$(command -v ranger)" ]
    then

        ln -s ~/dotfiles/shared/ranger/rc.conf ~/.config/ranger/
        ln -s ~/dotfiles/shared/ranger/rifle.conf ~/.config/ranger/
        ln -s ~/dotfiles/shared/ranger/bookmarks ~/.config/ranger/
        ln -s ~/dotfiles/shared/ranger/tagged ~/.config/ranger/

        echo ranger found, configis symbolic link establish.

    else
        echo ranger not found, no action taken.
    fi
    ask_user
    }

# neofetch
neofetch_link()
    {
    if [ -x "$(command -v neofetch)" ]
    then
        ln -s ~/dotfiles/neofetch/sheared/config.conf ~/.config/neofetch/
        echo neofetch found, config symbolic link establish.
    else
        echo neofetch not found, no action taken.
    fi
    ask_user
    }

# Git
git_link()
    {
    ln -s ~/dotfiles/shared/git/.gitconfig ~/
    }

alias_link()
    {
    echo alias source in .zshrc and .bashrc
    }


# exit
exit_link()
    {
    exit
    }


###############################

#dotfile_location
ask_user
