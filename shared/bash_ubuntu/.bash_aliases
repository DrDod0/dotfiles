#!/bin/bash

# Tmux alias
    alias tl='tmux ls'
    alias td='tmux detach'
    alias ta='tmux attach'
    alias tk='tmux kill-server'
    alias tu='tmux'
    alias source.tmux='tmux source-file $HOME/.tmux.conf'

# bash
    alias ls='ls -a'
    alias q='exit'
    alias ra='ranger'
    alias ran='ranger'
    alias c='clear'
    alias source.bash='source $HOME/.bashrc'

# locations
    alias notes='cd ~/notes/'
    alias note='cd ~/notes/'
    alias code='cd ~/notes/code/'
    alias dot='cd ~/dotfiles'

# todo.txt
    #alias t='~/Dropbox/todo.txt/todo.sh'

# Dropbox
    alias dropbox.status='~/dropbox.py status'

# w3m
    alias net='w3m www.duckduckgo.com'

# git
    alias pub='sh ~/notes/code/git.sh'

# vim
    #alias vim='nvim'
    #alias vi='nvim'

    alias vimrc='vim ~/dotfiles/vim/.vimrc'
    alias source.vimrc='source $HOME/.vimrc'

# OS update/upgrade pkts
    alias update='sh ~/notes/code/update.sh'

# Python
    alias py='python3'

# Pip
    alias pip='pip3'

# Newsboat
    alias news='newsboat'

# SSH

    alias ssh.status='/etc/init.d/ssh status'
    alias ssh.reload='/etc/init.d/ssh reload'
    alias ssh.stop='/etc/init.d/ssh stop'
    alias ssh.restart='/etc/init.d/ssh restart'
    alias ssh.start='/etc/init.d/ssh start'
    # ssh.help
    alias ssh.help='cat $HOME/dotfiles/help/ssh.help'

