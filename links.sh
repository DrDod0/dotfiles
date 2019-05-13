#!/bin/bash
# Author: Veggietorta
# Update: 05.04.19
# Puporse: Establish symbolic links.

# Remove existing directory and configs
#rm_all()
#    {
#
#    # bashrc
#    rm -rf $HOME/.bashrc 2>/dev/null
#
#    # vim plugins
#    rm -rf $HOME/.vim/bundle/ 2>/dev/null
#
#    # ranger
#    rm -rf $HOME/.config/ranger/ 2>/dev/null
#
#    # neovim
#    rm -rf $HOME/.config/nvim/ 2>/dev/null
#
#    # neofetch
#    rm -rf $HOME/.config/neofetch/ 2>/dev/null
#
#    # newsboat
#    rm -rf $HOME/.config/newsboat/urls 2>/dev/null
#    rm -rf $HOME/.config/newsboat/config 2>/dev/null
#
#    # tmux
#    rm -rf $HOME/.tmux.conf 2>/dev/null
#
#    # neomutt
#    rm -rf $HOME/.neomuttrc 2>/dev/null
#
#    ask_user
#    }
#

# vim
#vim_link()
#    {
#        # check for program of vim
#    if [ -x "$(command -v nvim)" ]
#    then
#        # vim program found, symbolic link established, send back to user
#        ln -s ~/dotfiles/shared/vim/.vimrc ~/
#        echo vim program found, created symbolic link.
#        ask_user
#    else
#        # vim program NOT found, no action taken, send back to user
#        echo vim program NOT installed, no action taken.
#        ask_user
#    fi
#    }
#
## neovim
#neovim_link()
#    {
#        # check for program neovim
#    if [ -x "$(command -v nvim)" ]
#    then
#         # create nvim directory
#         mkdir ~/.config/nvim/
#         # neovim program found, symbolic link established, send back to user
#         ln -s ~/dotfiles/shared/neovim/init.vim ~/.config/nvim/
#         echo neovim program found, created symbolic link.
#         ask_user
#     else
#         # neovim program NOT found, no action taken, send back to user
#         echo neovim program NOT installed, no action taken.
#         ask_user
#     fi
#    }
#
### bash

### error 'bash_link:3; = not found'
    # FIX too, from '==' to '=' in line 3
    #

zsh_link()
    {
    # capture terminal output and save to tmp.log
    exec 1> ~/dotfiles/tmp.log
    echo $SHELL

    # read and assign variable 'shell_readout' to file content
    shell_readout=$(cat ~/dotfiles/tmp.log)
    echo $shell_readout



    }


    zsh_link

# tmux
#tmux_link()
#    {
#    if [ -x "$(command -v tmux)" ]
#    then
#        ln -s $HOME/dotfiles/tmux/.tmux.conf $HOME/
#        echo tmux found, symbolic link established.
#    else
#        echo tmux not found, no action taken.
#    fi
#    ask_user
#    }
#
## neomutt
#neomuttrc_link()
#    {
#    if [ -x "$(command -v mutt)" ]
#    then
#        ln -s ~/dotfiles/neomutt/.neomuttrc ~/
#        echo mutt found, symbolic link established
#    else
#        echo mutt not found, no action taken.
#    fi
#    ask_user
#    }
#
## newsboat config
#newsboat_link()
#    {
#    if [ -x "$(command -v newsboat)" ]
#    then
#        ln -s ~/dotfiles/newsboat/config ~/.config/newsboat/
#        echo newsboat found, .config symbolic link established
#
#        ln -s ~/dotfiles/newsboat/urls ~/.config/newsboat/
#        echo newsboat urls sybolic link for established.
#
#    else
#        echo newsboat not found, no action taken.
#
#    ask_user
#    fi
#    }
#
## ranger configs
#ranger_link()
#    {
#    if [ -x "$(command -v ranger)" ]
#    then
#
#        ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger/
#        ln -s ~/dotfiles/ranger/rifle.conf ~/.config/ranger/
#        ln -s ~/dotfiles/ranger/bookmarks ~/.config/ranger/
#        ln -s ~/dotfiles/ranger/tagged ~/.config/ranger/
#
#        echo ranger found, configis symbolic link establish.
#
#    else
#        echo ranger not found, no action taken.
#    fi
#    ask_user
#    }
#
## neofetch config
#neofetch_link()
#    {
#    if [ -x "$(command -v neofetch)" ]
#    then
#        ln -s ~/dotfiles/neofetch/config.conf ~/.config/neofetch/
#        echo neofetch found, config symbolic link establish.
#    else
#        echo neofetch not found, no action taken.
#    fi
#    ask_user
#    }
#
## powerline config
#powerline_link()
#    {
#    if [ -x "$(command -v powerline-shell)" ]
#    then
#        ln -s ~/dotfiles/powerline/config.json ~/.config/powerline-shell/
#        echo powerline-shell found, config symbolic link established.
#    else
#        echo powerline-shell not found, no action taken
#    fi
#    ask_user
#    }
#
#git_link()
#    {
#    ln -s ~/dotfiles/git/.gitconfig ~/
#    }
#
# exit
#exit_link()
#    {
#    exit
#    }
#

###############################

#ask_user()
#    {
#    echo -n 'Select the number for the symbolic link you want setup
#
#         1. "vim"
#         2. "bash"
#         3. "neovim"
#         4. "tmux"
#         5. "neomutt"
#         6. "newsboat"
#         7. "ranger"
#         8. "neofetch"
#         9. "poweline-shell"
#         z. "remove all"
#         g. "git"
#         0. "exit")
#            : '
#
#    read ans
#
#    case "$ans" in
#        1)
#            vim_link # vim_link is linked to neovim_link
#            ;;
#        2)
#            bash_link
#            ;;
#        3)
#            neovim_link
#            ;;
#        4)
#            tmux_link
#            ;;
#        5)
#            neomuttrc_link
#            ;;
#        6)
#            newsboat_link
#            ;;
#        7)
#            ranger_link
#            ;;
#        8)
#            neofetch_link
#            ;;
#        9)
#            powerline_link
#            ;;
#        g)
#            git_link
#            ;;
#        z)
#            rm_all
#            ;;
#        0)
#            exit_link
#            ;;
#        # FIX zsh needed
#    esac
#    }
#
#########################################################
#ask_user
#



