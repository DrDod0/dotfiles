#!/bin/bash
# Author: veggietorta
# Update: 10.06.19
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


ask_user()
    {

    clear
    echo "Which configuration would you like to establish:
                 a. alias
                 b. help

                 1. zsh
                 2. bash
                 3. git
                 4. neofetch
                 5. ranger
                 6. newsboat
                 7. mutt
                 8. tmux
                 9. neovim
                10. vim
                11. remove_all
                12. sqlite
                13. irssi
                14. qutebrowser
                15. iterm
                16. mpv
                17. starship
                18. w3m

            "

            read configuration_answer

            case "$configuration_answer" in

                1) zsh_link;;
                2) bash_link;;
                3) git_link;;
                4) neofetch_link;;
                5) ranger_link;;
                6) newsboat_link;;
                7) muttrc_link;;
                8) tmux_link;;
                9) neovim_link;;
                10) vim_link;;
                12) remove_all;;
                13) irssi_link;;
                14) qutebrowser_link;;
                15) iterm_link;;
                16) mpv_link;;
                17) starship_link;;
                18) w3m_link;;

                a) alias_link;;
                b) help_link;;
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

    # neomutt & mutt
    rm -rf $HOME/.neomuttrc 2>/dev/null
    rm -rf $HOME/.muttrc

    ask_user
    }

# bash
bash_link()
    {
        if [ -x "$(command -v bash)" ]
        then
            rm ~/.bashrc
            ln -s ~/dotfiles/configs/bash/.bashrc ~/
            echo bash program found, created symbolick link
        else
            echo bash program NOT found, no action taken
        fi
    }

# zsh
zsh_link()
    {
    if [ -x "$(command -v zsh)" ]
    then
         echo zsh program found, created symbolic link
    else
       echo zsh program NOT found, no action taken.
    fi
    }

# vim
vim_link()
    {
        # check for program of vim
    if [ -x "$(command -v nvim)" ]
    then
        # vim program found, symbolic link established, send back to user
        rm ~/.vimrc
        ln -s ~/dotfiles/configs/vim/.vimrc ~/
        ln -s /dotfiles/configs/vim/.selected_editor ~/
        echo vim program found, created symbolic link.
    else
        # vim program NOT found, no action taken, send back to user
        echo vim program NOT installed, no action taken.
    fi
    }

# neovim
neovim_link()
    {
        # check for program neovim
    if [ -x "$(command -v nvim)" ]
    then
         # create nvim directory
	 mkdir ~/.config/
         mkdir ~/.config/nvim/
         # neovim program found, symbolic link established, send back to user
         ln -s ~/dotfiles/configs/neovim/init.vim ~/.config/nvim/
         echo neovim program found, created symbolic link.
     else
         # neovim program NOT found, no action taken, send back to user
         echo neovim program NOT installed, no action taken.
     fi
    }

# tmux
tmux_link()
    {
    if [ -x "$(command -v tmux)" ]
    then
        ln -s $HOME/dotfiles/configs/tmux/.tmux.conf $HOME/
        echo tmux found, symbolic link established.
    else
        echo tmux not found, no action taken.
    fi
    }

# mutt
muttrc_link()
    {
    if [ -x "$(command -v mutt)" ]
    then
        # .mailcap
        ln -s ~/dotfiles/configs/mutt/.mailcap ~/
        # .muttrc
        ln -s ~/dotfiles/configs/mutt/.muttrc ~/
        # Accounts
        ln -s ~/notes/code/account.gm ~/
        ln -s ~/notes/code/account.me ~/

        echo mutt found, symbolic link established
    else
        echo mutt not found, no action taken.

    fi
    }

# newsboat
newsboat_link()
    {
    if [ -x "$(command -v newsboat)" ]
    then
        ln -s ~/dotfiles/configs/newsboat/config ~/.config/newsboat/
        # OSX path tested
        ln -s ~/dotfiles/configs/newsboat/config ~/.newsboat/

        echo newsboat found, .config symbolic link established


        ln -s ~/dotfiles/configs/newsboat/urls ~/.config/newsboat/
        # OSX path tested
        ln -s ~/dotfiles/configs/newsboat/urls ~/.newsboat/

        echo newsboat urls sybolic link for established.

    else
        echo newsboat not found, no action taken.
    fi
    }

# ranger
ranger_link()
    {
    if [ -x "$(command -v ranger)" ]
    then
        mkdir ~/.config
        mkdir ~/.config/ranger/
        ln -s ~/dotfiles/configs/ranger/rc.conf ~/.config/ranger/
        ln -s ~/dotfiles/configs/ranger/rifle.conf ~/.config/ranger/
        ln -s ~/dotfiles/configs/ranger/bookmarks ~/.config/ranger/
        ln -s ~/dotfiles/configs/ranger/tagged ~/.config/ranger/

        echo ranger found, configis symbolic link establish.

    else
        echo ranger not found, no action taken.
    fi
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
    }

# Git
git_link()
    {
    ln -s ~/dotfiles/configs/git/.gitconfig ~/
    }

# alias
alias_link()
    {
    echo alias source in .zshrc and .bashrc
    }

# qutebrowser
qutebrowser_link()
    {
    if [ -x "$(command -v qutebrowser)" ]
    then
        ln -s ~/dotfiles/configs/qutebrowser/config.py ~/.qutebrowser
        echo found qutebrowser, config symbolic link establish.
    else
        echo qutebrowser not found, no action taken.
    fi
    }

#iterm TODO

# mpv TODO

# starship TODO

# w3m TODO

# exit
exit_link()
    {
    exit
    }


###############################

ask_user
