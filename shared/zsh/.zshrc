# Author: @veggietorta
# Last updated: 09.17.19


# If you come from bash you might have to change your $PATH.
    # export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
    #export ZSH="/root/.oh-my-zsh"
    export ZSH="$HOME/.oh-my-zsh" # osx path

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

# Disable auto-setting terminal title.
    # DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
    # ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"

# Uncomment to disable version control tracking
    # DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
    # stamp shown in the history command output.
    # You can set one of the optional three formats:
    # "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
    # or set a custom format using the strftime function format specifications,
    # see 'man strftime' for details.
    # HIST_STAMPS="mm/dd/yyyy"

# Custom folder than $ZSH/custom?
    # ZSH_CUSTOM=/path/to/new-custom-folder

# Plugin to load. Standard plugins can be found in ~/.oh-my-zsh/plugins/*
    # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
    # Example format: plugins=(rails git textmate ruby lighthouse)

    # Git
    plugins=(git)

    # Oh-my-zsh
    source $ZSH/oh-my-zsh.sh

# User configuration
    # export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
    # export LANG=en_US.UTF-8


# Preferred editor for local and remote sessions
    if [[ -n $SSH_CONNECTION ]]; then
      export EDITOR='vim'
    else
      export EDITOR='nvim'
    fi


# Compilation flags
    # export ARCHFLAGS="-arch x86_64"


# ssh
    # export SSH_KEY_PATH="~/.ssh/rsa_id"


# Personal Aliases:
    source ~/dotfiles/shared/alias/alias


# Neofetch:
    if [ -x "$(command -v neofetch)" ]
    then
        neofetch
    fi


# Vim Keybinding in shell:
    bindkey -v


# Openvpn:
    export PATH=$PATH:/usr/local/Cellar/openvpn/2.4.7_1/sbin


# FZF
    #[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
