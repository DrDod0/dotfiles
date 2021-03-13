# Author: @veggietorta
# Last updated: 03.09.21
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

# Oh-My-Zsh
	source $ZSH/oh-my-zsh.sh

# Alias Location
    source ~/dotfiles/configs/alias/alias_ubuntu

# Vim Keybinding in shell:
	bindkey -v

# Prevents the current line from being saved in the history if it is the same as previous one.
	setopt histignoredups


# FZF
    # Source if installed
    if [ -x "$(command -v fzf)" ]
    then
        source /usr/share/doc/fzf/examples/key-bindings.zsh
        source /usr/share/doc/fzf/examples/completion.zsh
    fi

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

# neofetch like script, minimalist
    # script in $HOME/dotfiles/configs/ufetch directory
    #
    if [ -d "$HOME/dotfiles" ];
        then
            sh ~/dotfiles/configs/ufetch/ubuntu
    fi


# GNOME Terminal, reduce title bar, requires xdotool
    if [ -x "$(command -v xdotool)" ];
    then
        #
        if [ "$TERM" = "xterm-256color" ]; then
          xprop \
            -id $(xdotool getactivewindow) \
            -f _MOTIF_WM_HINTS 32c \
            -set _MOTIF_WM_HINTS "0x2, 0x0, 0x0, 0x0, 0x0"
        fi
    fi



# Easy Color for Shell
    # https://www.reddit.com/r/linux/comments/qagsu/easy_colors_for_shell_scripts_color_library/
    bold=`echo -en "\e[1m"`; underline=`echo -en "\e[4m"`; dim=`echo -en "\e[2m"`; strickthrough=`echo -en "\e[9m"`; blink=`echo -en "\e[5m"`; reverse=`echo -en "\e[7m"`; hidden=`echo -en "\e[8m"`; normal=`echo -en "\e[0m"`; black=`echo -en "\e[30m"`; red=`echo -en "\e[31m"`; green=`echo -en "\e[32m"`; orange=`echo -en "\e[33m"`; blue=`echo -en "\e[34m"`; purple=`echo -en "\e[35m"`; aqua=`echo -en "\e[36m"`; gray=`echo -en "\e[37m"`; darkgray=`echo -en "\e[90m"`; lightred=`echo -en "\e[91m"`; lightgreen=`echo -en "\e[92m"`; lightyellow=`echo -en "\e[93m"`; lightblue=`echo -en "\e[94m"`; lightpurple=`echo -en "\e[95m"`; lightaqua=`echo -en "\e[96m"`; white=`echo -en "\e[97m"`; default=`echo -en "\e[39m"`; BLACK=`echo -en "\e[40m"`; RED=`echo -en "\e[41m"`; GREEN=`echo -en "\e[42m"`; ORANGE=`echo -en "\e[43m"`; BLUE=`echo -en "\e[44m"`; PURPLE=`echo -en "\e[45m"`; AQUA=`echo -en "\e[46m"`; GRAY=`echo -en "\e[47m"`; DARKGRAY=`echo -en "\e[100m"`; LIGHTRED=`echo -en "\e[101m"`; LIGHTGREEN=`echo -en "\e[102m"`; LIGHTYELLOW=`echo -en "\e[103m"`; LIGHTBLUE=`echo -en "\e[104m"`; LIGHTPURPLE=`echo -en "\e[105m"`; LIGHTAQUA=`echo -en "\e[106m"`; WHITE=`echo -en "\e[107m"`; DEFAULT=`echo -en "\e[49m"`;



