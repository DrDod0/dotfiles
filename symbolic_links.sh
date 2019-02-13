#! /bin/bash/

#TODO test each function


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
    }

bash_aliases_link()
    {
    if [ -e ~/.bash_aliases ]
    then
        rm ~/.bash_aliases
        ln -s ~/dotfiles/bash/.bash_aliases ~/
    else
        ln -s ~/dotfiles/bash/.bash_aliases ~/
    fi
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
    }

# vim_link
# bashrc_link
# bash_aliases_link
# tmux_link

