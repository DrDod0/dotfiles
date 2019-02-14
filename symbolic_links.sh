#!/bin/bash


# vim
vim_link()
    {
        # check for existance of vimrc in $HOME directory
    if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]

    then
        # vimrc found, remove found vimrc and create symbolic link from vimrc in dotfiles
        unlink ~/.vimrc # should a symbolic link already exist
        rm ~/.vimrc &> /dev/null # &> /dev/null suppress error message.
		echo a vimrc was found, removed and replaced

    else
        # vimrc not found, created symbolic link
        ln -s ~/dotfiles/vim/.vimrc ~/
		echo vimrc not found, created symbolic link
    fi
    ask_user
    }

# bash
bashrc_link()
    {
    if [ -e ~/.bashrc ]
    then
        rm ~/.bashrc
	    ln -s ~/dotfiles/bash/.bashrc ~/
    else
        ln -s ~/dotfiles/bash/.bashrc ~/
    fi
    ask_user
    }

# bash_aliases
bash_aliases_link()
    {
    if [ -e ~/.bash_aliases ]
    then
        rm ~/.bash_aliases
        ln -s ~/dotfiles/bash/.bash_aliases ~/
    else
        ln -s ~/dotfiles/bash/.bash_aliases ~/
    fi
    ask_user
    }

# tmux
tmux_link()
    {
    if [ -e ~/.tmux.conf ]
    then
        rm ~/.tmux.config
        ln -s ~/dotfiles/tmux/.tmux.conf ~/
    else
        ln -s ~/dotfiles/tmux/.tmux.conf ~/
    fi
    ask_user
    }

# neomutt
neomuttrc_link()
    {
    if [ -e ~/.neomuttrc ]
    then
        rm ~/.neomuttrc
        ln -s ~/dotfiles/neomutt/.neomuttrc ~/
    else
        ln -s ~/dotfiles/neomutt/.neomuttrc ~/
    fi
    ask_user
    }


ask_user()
    {
    echo -n 'Select the symbolic link you want setup

         1. "vim"
         2. "bash"
         3. "bash aliases"
         4. "tmux"
         5. "neomutt"
         9. "All"
         0. "exit")
                '

    read ans

    case "$ans" in
        1)
            vim_link
            ;;
        2)
            bash_link
            ;;
        3)
            bash_aliases_link
            ;;
        4)
            tmux_link
            ;;
        5)
            neomuttrc_link
            ;;
        9)
            vim_link && bashrc_link && bash_aliases_link && tmux_link && neomuttrc_link
            ;;
        0)
            exit
            ;;
    esac
    }

########################################################

ask_user

