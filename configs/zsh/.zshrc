# Author: @veggietorta Last updated: 10.22.19

# Source a small script to determine systerms OS.
    source ~/dotfiles/configs/zsh/os_check.sh

# If you come from bash you might have to change your $PATH.
    # export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
    export ZSH="$HOME/.oh-my-zsh"

# Theme:
    ZSH_THEME="avit"

# Case-sensitive completion.
    # CASE_SENSITIVE="true"

# Hyphen-insensitive completion. Case-sensitive completion must be off. _ and - will be interchangeable.
    # HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
    # DISABLE_AUTO_UPDATE="true"

# Auto-update (in days).
    # export UPDATE_ZSH_DAYS=13

# Disable colors in ls.
    # DISABLE_LS_COLORS="true"

# Disable auto-setting terminal ttle.
    # DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
    # ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"

# Uncomment to disable version control tracking
    # DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
    # stamp shown in the history command output. You can set one of the optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd" or set a custom format using the strftime function format
    # specifications, see 'man strftime' for details. HIST_STAMPS="mm/dd/yyyy"

# Custom folder than $ZSH/custom?
    # ZSH_CUSTOM=/path/to/new-custom-folder

# Plugin to load. Standard plugins can be found in ~/.oh-my-zsh/plugins/*
    # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/ Example format: plugins=(rails git textmate ruby lighthouse)

    plugins=(
        git
        )

# Oh-my-zsh
    source $ZSH/oh-my-zsh.sh


# User configuration
    # export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
    export LANG=en_US.UTF-8


# Preferred editor for local and remote sessions
    if [[ -n $SSH_CONNECTION ]]; then
      export EDITOR='nvim'
    else
      export EDITOR='nvim'
    fi


# Compilation flags
    # export ARCHFLAGS="-arch x86_64"


# ssh
    # export SSH_KEY_PATH="~/.ssh/rsa_id"


# Personal Aliases:
#   Pulls $OS_sys variable from source on line-3 & sources alias based on OS.

    if [[ $OS_sys == 🍎 ]]
    then
        source ~/dotfiles/configs/alias/alias_osx
    elif [[ $OS_sys == 🐧 ]]
    then
        source ~/dotfiles/configs/alias/alias_ubuntu
    else
        echo 'System not recognized, alias not sourced'
    fi


# Neofetch:
    if [ -x "$(command -v neofetch)" ]
    then
        neofetch
    fi


# Vim Keybinding in shell:
    bindkey -v


# Openvpn:
    export PATH=$PATH:/usr/local/Cellar/openvpn/2.4.7_1/sbin


# Hombrew:
    export PATH="/usr/local/sbin:$PATH"


# Let files beginning with a . to be matched.
    # Example:
        #  <$ ls -d *zshr> <$ .zshrc

    setopt globdots


# Prevents the current line from being saved in the history if it is the same as previous one.
    setopt histignoredups


# iTerm2 Shell Intergration TODO [] screen for OSX
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# Kitty-Terminal
    if [ -x "$(command -v kitty)" ]
        then
            autoload -Uz compinit
            compinit
        # Completion for kitty
            kitty + complete setup zsh | source /dev/stdin
    fi

# FZF
    # Source if installed
    if [ -x "$(command -v fzf)" ]
        then
            [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
            plugins=(fzf)
    fi

    # Keybinding open
    #bindkey -s '^o' 'nvim $(fzf)\n'
    #bindkey -s '^o' 'nvim $(fzf)^M'

    bindkey -s '^o' 'nvim $(du -a ~/dotfiles/ ~/notes/ | awk "{print $2}" | fzf )^M'

# Starship prompt
    if [ -x "$(command -v starship)" ]
        then
            eval "$(starship init zsh)"
    fi

# Zsh Syntax-Highlighting
    #source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
