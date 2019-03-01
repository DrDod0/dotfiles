#!/bin/bash


# Lets remove any existing directory and configs
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


# vim
vim_link()
    {
        # check for existance of vim
    if [ -x "$(command -v nvim)" ]
    then
        # vim existrance found, symbolic link established
        ln -s ~/dotfiles/vim/.vimrc ~/
        echo vim found, created symbolic link.
        ask_user
    else
        # vim existance NOT found, no action taken, send back to user prompt.
        echo vim NOT found, no action taken.
        ask_user
    fi
    }

#neovim
neovim_link()
    {
    if [ -x "$(command -v nvim)" ]
    then
         ln -s ~/dotfiles/neovim/init.vim ~/.config/nvim/
         echo neovim found, created symbolic link.
     else
         echo neovim not found, no action taken.
     fi
     ask_user
    }

# bash
bash_link()
    {
	ln -s $HOME/dotfiles/bash/.bashrc $HOME/
    echo No check done, .bashrc setup.
    ask_user
    }

# tmux
tmux_link()
    {
    if [ -x "$(command -v tmux)" ]
    then
        ln -s $HOME/dotfiles/tmux/.tmux.conf $HOME/
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
        ln -s ~/dotfiles/neomutt/.neomuttrc ~/
        echo mutt found, symbolic link established
    else
        echo mutt not found, no action taken.
    fi
    ask_user
    }

#newsboat config
newsboat_link()
    {
    if [ -x "$(command -v newsboat)" ]
    then
        ln -s ~/dotfiles/newsboat/config ~/.config/newsboat/
        echo newsboat found, .config symbolic link established

        ln -s ~/dotfiles/newsboat/urls ~/.config/newsboat/
        echo newsboat urls sybolic link for established.

    else
        echo newsboat not found, no action taken.

    ask_user
    fi
    }

#ranger configs
ranger_link()
    {
    if [ -x "$(command -v ranger)" ]
    then

        ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger/
        ln -s ~/dotfiles/ranger/rifle.conf ~/.config/ranger/
        ln -s ~/dotfiles/ranger/bookmarks ~/.config/ranger/
        ln -s ~/dotfiles/ranger/tagged ~/.config/ranger/

        echo ranger found, configis symbolic link establish.

    else
        echo ranger not found, no action taken.
    fi
    ask_user
    }

# neofetch config
neofetch_link()
    {
    if [ -x "$(command -v neofetch)" ]
    then
        ln -s ~/dotfiles/neofetch/config.conf ~/.config/neofetch/
        echo neofetch found, config symbolic link establish.
    else
        echo neofetch not found, no action taken.
    fi
    ask_user
    }

# powerline config
powerline_link()
    {
    if [ -x "$(command -v powerline-shell)" ]
    then
        ln -s ~/dotfiles/powerline/config.json ~/.config/powerline-shell/
        echo powerline-shell found, config symbolic link established.
    else
        echo powerline-shell not found, no action taken
    fi
    ask_user
    }


# exit
exit_link()
    {
    exit
    }


###############################

ask_user()
    {
    echo -n 'Select the number for the symbolic link you want setup

         1. "vim"
         2. "bash"
         3. "neovim"
         4. "tmux"
         5. "neomutt"
         6. "newsboat"
         7. "ranger"
         8. "neofetch"
         9. "poweline-shell"
         z. "remove all"
         0. "exit")
            : '

    read ans

    case "$ans" in
        1)
            vim_link # vim_link is linked to neovim_link
            ;;
        2)
            bash_link
            ;;
        3)
            neovim_link
            ;;
        4)
            tmux_link
            ;;
        5)
            neomuttrc_link
            ;;
        6)
            newsboat_link
            ;;
        7)
            ranger_link
            ;;
        8)
            neofetch_link
            ;;
        9)
            powerline_link
            ;;
        z)
            rm_all
            ;;
        0)
            exit_link
            ;;
    esac
    }

########################################################
ask_user




