# Author: @veggietorta Last updated: 08.04.20


# Path to your oh-my-zsh installation.
	export ZSH="$HOME/.oh-my-zsh"

# Theme:
	ZSH_THEME="avit"

# Display red dots whilst waiting for completion.
	COMPLETION_WAITING_DOTS="true"


# Plugin to load. Standard plugins can be found in ~/.oh-my-zsh/plugins/*
    # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/ Example format: plugins=(rails git textmate ruby lighthouse)

    plugins=(
        brew
        git
        z
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

# mpv player run through terminal
video(){

    PAGE=$(curl -s $1)
    url="$(echo \"$PAGE\" | grep -Eoi '<source [^>]+>' | grep -Eo 'src="[^\"]+"' | grep -Eo '(http|https)://[^"]+')"
    TITLE=$(echo \"$PAGE\" | grep -oEi "<title>(.*)</title>" | cut -d '>' -f2 | cut -d '<' -f1)
    mpv --ontop=yes --title="$TITLE" --snap-window --autofit-larger='25%' --geometry='-10-10' $url &
    }

# Remap Capslock to Esc:
# 	xcape required
# 	coming out of sleep mode will reset the keys.
	setxkbmap -option ctrl:swapcaps
	xcape -e 'Control_L=Escape'
