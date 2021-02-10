# Author: @veggietorta
# Last updated: 08.04.20
# Location: ~/

# Path to your oh-my-zsh installation.
    export ZSH="$HOME/.oh-my-zsh"

# Theme:
	ZSH_THEME="bira"

# Plugin to load. Standard plugins can be found in ~/.oh-my-zsh/plugins/*
    # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/ Example format: plugins=(rails git textmate ruby lighthouse)
    plugins=(
        git
        extract
        colored-man-pages
        sudo
        history
        npm
        python
        ubuntu
        zsh-interactive-cd
        web-search
        z
        #tmux
        systemadmin
        safe-paste
        last-working-dir
        colorize
        )

# Oh-my-zsh
	source $ZSH/oh-my-zsh.sh

# Alias location
    source ~/dotfiles/configs/alias/alias_ubuntu

# Vim Keybinding in shell:
	bindkey -v

# Prevents the current line from being saved in the history if it is the same as previous one.
	setopt histignoredups


# FZF
    # Source if installed
#    if [ -x "$(command -v fzf)" ]
#        then
#            [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#            plugins=(fzf)
#    fi

    # Keybinding open
    #bindkey -s '^o' 'nvim $(fzf)\n'
    #bindkey -s '^o' 'nvim $(fzf)^M'

#    bindkey -s '^o' 'nvim $(du -a ~/dotfiles/ ~/notes/ | awk "{print $2}" | fzf )^M'


# Set screen color temp
    # requires, sct
    if [ -x "$(command -v sct)" ]
    then
        sct 3500
    fi

# neofetch
    # if neofetch is install run neofetch
    # with terminal emulator Terminology install
    # --tycat image view, unique to Terminology
    # --source <path to image>
#    if [ -x "$(command -v neofetch)" ]
#    then
#        neofetch --tycat --source $HOME/dotfiles/configs/wallpapers/muerte.jpg
#    fi

#neofetch --tycat --source $HOME/dotfiles/configs/wallpapers/muerte.jpg
