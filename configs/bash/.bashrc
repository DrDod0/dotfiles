# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi



####################### veggietorta <3 #########################
# Updated: 05.21.21

# Alias
    if [ -d "~/dotfiles" ]
        then
            source ~/dotfiles/configs/alias/alias_ubuntu
    fi

    alias ytmp3='youtube-dl -x --audio-format mp3'
    alias plex="ssh -p 5056 ubuntu@10.216.1.18"
    alias dev="ssh -p 5056 dev@10.216.1.20"
    alias python="python3"
    alias yt="ytfzf -t"
    alias vifm="vifm ."
    alias merge="sh ~/notes/code/scripts/script_merge_mp3.sh"

# Dracula Theme
#if [ "$TERM" = "linux" ]; then
#        printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
#        printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
#        printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
#        printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
#        printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
#        printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
#        printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
#        printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
#        printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
#        printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
#        printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
#        printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
#        printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
#        printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
#        printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
#        printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
#        printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
#        printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
#        clear
#fi
#

# FZF
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Vim Keybindings
    if [ -x "$(command -v vim)" ]
    then
	    set -o vi
    fi

# Neofetch show at login/boot
    if [ -x "$(command -v neofetch)" ]
    then
	    neofetch
    fi

# GNOME Terminal, reduce title bar, requires xdotool
    if [ "$TERM" = "xterm-256color" ]; then
      xprop \
        -id $(xdotool getactivewindow) \
        -f _MOTIF_WM_HINTS 32c \
        -set _MOTIF_WM_HINTS "0x2, 0x0, 0x0, 0x0, 0x0"
    fi

# My motherfucking prompt
PS1="☠️  "
