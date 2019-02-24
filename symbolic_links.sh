#!/bin/bash


# Lets remove any existing directory and configs
rm_all()
    {
    # test
    rm -rf $HOME/.shit/ 2>/dev/null

    # vim plugins
    #rm -rf $HOME/.vim/bundle/

    # ranger configs
    #rm -rf $HOME/.config/ranger/

    # neovim  configs
    #rm -rf $HOME/.config/nvim/

    # neofetch configs
    #rm -rf $HOME/.config/neofetch/
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
    if [ -e ~/.config/nvim/init.vim]
    then
         ln -s ~/dotfiles/neovim/init.vim ~/.config/nvim/
         echo neovim init.vim file found and replaced with init.vim from dotfiles directory.
     else
         ln -s ~/dotfiles/neovim/init.vim ~/.config/nvim/
         echo neovim init.vim not found, init.vim file from dotfiles directory established.
     fi
     ask_user
    }

# bash
bash_link()
    {
    if [ -e ~/.bashrc ]
    then
        unlink ~/.bashrc
        rm ~/.bashrc
	    ln -s ~/dotfiles/bash/.bashrc ~/
        echo a .bashrc was found, removed and replaced
    else
        ln -s ~/dotfiles/bash/.bashrc ~/
        echo .bashrc not found, created symbolic link
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
    if [ -e ~/tmux.conf ]
    then
        rm ~/tmux.config
        ln -s ~/dotfiles/tmux/tmux.conf ~/
    else
        ln -s ~/dotfiles/tmux/tmux.conf ~/
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

#newsboat config
newsboat_config_link()
    {
    if [ -e ~/.config/newsboat/config ]
    then
        rm ~/.config/newsboat/config
        ln -s ~/dotfiles/newsboat/config ~/.config/newsboat/
        echo newsboat config was found, removed and a link from the dotfiles directory established.
    else
        ln -s ~/dotfiles/newsboat/config ~/.config/newsboat/
        echo newsboat config was not found, a link from the dotfiles directory was established.
    fi
    newsboat_urls_link
    }

#newsboat Url
newsboat_urls_link()
    {
    if [ -e ~/.config/newsboat/urls ]
    then
        rm ~/.config/newsboat/urls
        ln -s ~/dotfiles/newsboat/urls ~/.config/newsboat/
        echo newsboat urls was found, removed and a link from dotfiles directory established.
    else
        ln -s ~/dotfiles/newsboat/urls ~/.config/newsboat/
        echo newsboat urls not was not found, a link from the dotfiles directory was established.
    fi
    ask_user
    }

#ranger configs
ranger_link()
    {
    if [ -e ~/.config/ranger/rc.conf ]
    then
        rm -rf ~/.config/ranger/rc.conf
        rm -rf ~/.config/ranger/rifle.conf
        rm -rf ~/.config/ranger/bookmarks
        rm -rf ~/.config/ranger/tagged

        ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger/
        ln -s ~/dotfiles/ranger/rifle.conf ~/.config/ranger/
        ln -s ~/dotfiles/ranger/bookmarks ~/.config/ranger/
        ln -s ~/dotfiles/ranger/tagged ~/.config/ranger/

        echo ranger config files were found, removed and a link from dotfiles directory established.

    else
        ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger/
        ln -s ~/dotfiles/ranger/rifle.conf ~/.config/ranger/
        ln -s ~/dotfiles/ranger/bookmarks ~/.config/ranger/
        ln -s ~/dotfiles/ranger/tagged ~/.config/ranger/

        echo ranger config fiels were not found, a link from the dotfiles directory was established.
    fi
    ask_user
    }

# neofetch config
neofetch_link()
    {
    if [ -e ~/.config/neofetch/config.conf ]
    then
        rm ~/.config/neofetch/config.conf
        ln -s ~/dotfiles/neofetch/config.conf ~/.config/neofetch/
        echo neofetch config was found, removed and a link from dotfiles directory established.
    else
        ln -s ~/dotfiles/neofetch/config.conf ~/.config/neofetch/
        echo neofetch config not was not found, a link from the dotfiles directory was established.
    fi
    ask_user
    }

# powerline config
powerline_link()
    {
    if [ -e ~/.config/powerline-shell/config.json ]
    then
        rm ~/.config/powerline-shell/config.json
        ln -s ~/dotfiles/powerline/config.json ~/.config/powerline-shell/
        echo powerline-shell config was found, removed and a link from dotfiles directory established.
    else
        ln -s ~/dotfiles/powerline/config.json ~/.config/powerline-shell/
        echo powerline config not was not found, a link from the dotfiles directory was established.
    fi
    ask_user
    }



###############################

ask_user()
    {
    echo -n 'Select the number for the symbolic link you want setup

         1. "vim / neovim"
         2. "bash"
         3. "bash aliases"
         4. "tmux"
         5. "neomutt"
         6. "newsboat"
         7. "ranger"
         8. "neofetch"
         9. "poweline"
         *. "remove all"
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
            bash_aliases_link
            ;;
        4)
            tmux_link
            ;;
        5)
            neomuttrc_link
            ;;
        6)
            newsboat_config_link
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
        *)
            rm_all
            ;;
        0)
            exit
            ;;
    esac
    }

########################################################
ask_user




