#!/bin/bash
# Author: @veggietorta
# Update: 08.21.20
# Puporse: Automate a consistent configuration across rigs

#############################################################
#############################################################


ask_user()
{

    #clear
    echo "Which configuration would you like to establish:
                 a. alias
                 b. help
        		 q. quit

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
                15. todo
                16. mpv
                17. starship
                18. w3m
                19. vifm
                20. neomutt
                21. cheat

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
                15) todo_link;;
                16) mpv_link;;
                17) starship_link;;
                18) w3m_link;;
                19) vifm_link;;
                20) neomutt_link;;
                21) cheat_link;;


                a) alias_link;;
                b) help_link;;
            esac
}

#########################################################################
#########################################################################

# Install vim-plug plugin manager

    # install curl
        #sudo apt install curl -y

    # install vim-plug manager
        #sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# mpv TODO
# w3m TODO














# Git
git_link()
    {
    ln -s $HOME/dotfiles/configs/git/.gitconfig $HOME/
    }


# bash
bash_link()
    {
        if [ -x "$(command -v bash)" ]
        then
            rm $HOME/.bashrc
            ln -s $HOME/dotfiles/configs/bash/.bashrc $HOME/
            echo bash program found, created symbolick link
            ask_user
        else
            echo bash program NOT found, no action taken
            ask_user
        fi
    }


# zsh
zsh_link()
    {
    # check for program of ZSH
    if [ -x "$(command -v zsh)" ]
    then
    # remove any existing .zshcr
    # create symbolic link
    # return to user
         rm $HOME/.zshrc
         ln -s $HOME/dotfiles/configs/zsh/ubuntu/.zshrc $HOME/
         source $HOME/.zshrc
         echo zsh program found, created symbolic link and sourced.
         sleep 5 && echo -en '\007'
         ask_user
    else
    # ZSH program NOT found
    # install zsh

       echo zsh program NOT found, installing.
       sleep 3
       sudo apt sudo install zsh -y
       echo
       echo ZSH has been installed but with out Oh-my-Zsh its chop, installing Oh-my-Zsh
       sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
       echo
       echo "ZSH & Oh-my-zsh are now installed"
       ask_user
    fi
    }


# vim
vim_link()
    {
    # check for program of VIM
    if [ -x "$(command -v vim)" ]
    then
    # vim program found,
    # existing .virmc deleted
    # new config symbolic link established
    # send back to user
        rm $HOME/.vimrc
        ln -s $HOME/dotfiles/configs/vim/.vimrc $HOME/
        echo vim program found, created symbolic link.
        ask_user
    else
    # VIM program NOT found, no action taken
    # send back to user
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
    # create nvim directories for config file
        mkdir $HOME/.config/
        mkdir $HOME/.config/nvim/

    # remove existing vimrc and establish symbolic link
    # one config file is used for nvim and vim
        rm $HOME/.vimrc
        ln -s $HOME/dotfiles/configs/vim/.vimrc $HOME/

    # neovim program found, symbolic link established, send back to user
        ln -s $HOME/dotfiles/configs/neovim/init.vim $HOME/.config/nvim/
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
    # Check if program installed on system
    if [ -x "$(command -v tmux)" ]
    then
        ln -s $HOME/dotfiles/configs/tmux/.tmux.conf $HOME/
        echo tmux found, symbolic link established.
        ask_user
    else
        echo tmux not found, no action taken.
        ask_user
    fi
    }


# mutt
muttrc_link()
    {
    # Check if program installed on system
    if [ -x "$(command -v mutt)" ]
    then

        # .mailcap
        ln -s $HOME/dotfiles/configs/mutt/.mailcap $HOME/

        # .muttrc
        ln -s $HOME/dotfiles/configs/mutt/.muttrc $HOME/

        # Accounts
        ln -s $HOME/notes/code/account.gm $HOME/
        ln -s $HOME/notes/code/account.me $HOME/

        echo mutt found, symbolic link established.
        ask_user
    else
        echo mutt not found, no action taken.
        ask_user
    fi
    }


# newsboat
newsboat_link()
    {
    # check if Newsboat is installed
    if [ -x "$(command -v newsboat)" ]
    then
        ln -s $HOME/dotfiles/configs/newsboat/config $HOME/.config/newsboat/
        ln -s $HOME/dotfiles/configs/newsboat/urls $HOME/.config/newsboat/
        echo Newsboat found, symbolic link established.
        echo NEWSBOAT urls symbolic link established.
        ask_user

    else
        echo NEWSBOAT not found, no action taken.
        ask_user
    fi
    }


# ranger
ranger_link()
    {
    # check if RANGER is installed
    if [ -x "$(command -v ranger)" ]
    then
    # directories for configs
        mkdir $HOME/.config
        mkdir $HOME/.config/ranger/

    # remove any existing configs
        rm $HOME/.config/ranger/rc.conf
        rm $HOME/.config/ranger/rifle.conf
        rm $HOME/.config/ranger/bookmarks
        rm $HOME/.config/ranger/tagged

    # establish symbolic links to config files
    # send back to user
        ln -s $HOME/dotfiles/configs/ranger/rc.conf $HOME/.config/ranger/
        ln -s $HOME/dotfiles/configs/ranger/rifle.conf $HOME/.config/ranger/
        ln -s $HOME/dotfiles/configs/ranger/bookmarks $HOME/.config/ranger/
        ln -s $HOME/dotfiles/configs/ranger/tagged $HOME/.config/ranger/

        echo RANGER found, symbolic link established.
        ask_user

    else
        echo RANGER not found, no action taken.
        ask_user
    fi
    }


# neofetch
neofetch_link()
    {
    # check if NEOFETCH is installed
    if [ -x "$(command -v neofetch)" ]
    then
        ln -s $HOME/dotfiles/neofetch/sheared/config.conf $HOME/.config/neofetch/
        echo Neofetch found, symbolic link establish.
        ask_user
    else
        echo NEOFETCH not found, no action taken.
        ask_user
    fi
    }


# alias
alias_link()
    {
    echo alias already sourcedd /in .zshrc and .bashrc
    ask_user
    }


# qutebrowser
qutebrowser_link()
    {
    # check if qutebroswer is installed
    if [ -x "$(command -v vim)" ]
    then
        # create directories for configs
        mkdir $HOME/.configs/qutebrowser/
        /qutebrowser

        # remove existing config
        rm $HOME/dotfiles/configs/qutebrowser/config.py

        # establish symbolic link
        ln -s $HOME/dotfiles/configs/qutebrowser/config.py $HOME/.qutebrowser
        echo found qutebrowser, config symbolic link establish.
        ask_user
    else
        echo qutebrowser not found, no action taken.
        ask_user
    fi
    }


# vifm
vifm_link()
    {
    if [ -x "$(command -v vifm)" ]
    then
        rm $HOME/.config/vifm/vifmrc
        ln -s $HOME/dotfiles/configs/vifm/vifmrc ~/.config/vifm/
        ln -s $HOME/dotfiles/configs/vifm/gruvbox.vifm ~/.config/vifm/colors/
        ln -s $HOME/dotfiles/configs/vifm/molakai.vifm ~/.config/vifm/colors/
        ln -s $HOME/dotfiles/configs/vifm/dracula.vifm ~/.config/vifm/colors/
        echo found vifm, config and colorscheme symbolic link established.
        ask_user
    else
        echo vifm not found, no action taken.
        ask_user
    fi
    }


# neomutt
neomutt_link()
    {
    if [ -x "$(command -v neomutt)" ]
    then
        ln -s $HOME/dotfiles/configs/neomutt/neomuttrc ~/
        echo found neomutt, symbolic link established.
        ask_user
    else
        echo neomutt not found, no action taken.
        ask_user
    fi
    }


#todo
todo_link()
    {
    if [ -x "$(command -v todo.sh)" ]
    then
        ln -s $HOME/dotfiles/configs/todo/todo.cfg ~/
        echo found todo.txt-cli, symbolic link established.
        echo
        echo repo-dotfiles established alias t='todo.sh'

        ln -s /Users/vt/Library/Mobile\ Documents/com~apple~CloudDocs/todo.txt
        echo todo.txt symbolic link established

        ln -s /Users/vt/Library/Mobile\ Documents/com~apple~CloudDocs/done.txt
        echo done.txt symbolic link established

        ln -s /Users/vt/Library/Mobile\ Documents/com~apple~CloudDocs/report.txt
        echo report.txt symbolic link established
        ask_user

    fi
    }


#cheat
cheat_link()
    {
        if [ -x "$(command -v cheat)" ]
        then
            cd $HOME/.config/
            mkdir cheat
            cd cheat
            ln -s $HOME/dotfiles/configs/cheat/conf.yml $HOME/.config/cheat/
            echo "found cheat, symbolic link established"
            ask_user
        else
            echo "cheat not installed, to install 'brew install cheat'"
            ask_user
        fi
    }


# exit
exit_link()
    {
    exit
    }


###############################

ask_user
