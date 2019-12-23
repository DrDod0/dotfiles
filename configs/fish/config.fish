# Author: @veggietorta
# Last updated: 12.15.19


###################################################
# vim keybindings
###################################################

function fish_user_key_bindings
  fish_vi_key_bindings
end

###################################################
# Python 3
###################################################

alias py='python3'

###################################################
# Fzf
###################################################

alias ff='vim ~/dotfiles ~/notes (FZF)'


###################################################
# System
###################################################

alias q='exit'

alias v='vifm'

alias c='clear'

alias l='exa -lahF'

alias ls='ls -F'


#################################################
# Locations
#################################################

alias code='cd ~/notes/code/'

function note # note
    cd ~/notes/
end


function dot # dot
    cd ~/dotfiles/
end


function journal # journal
    cd ~/notes/mental_health/journal/
end

##################################################
# Git
##################################################

alias gs='git status'

alias gc='git commit -message'

alias gp='git push'

alias ga='git add -A'


##################################################
# vim

#function vim
#    nvim
#end


#function vi
#    vim
#end



##################################################
# tmux
##################################################

alias tl='tmux ls'

alias td='tmux detach'

alias ta='tmux attach'

alias tk='tmux kill-server'

alias tu='tmux'

alias source.tmux='tmux source-file $HOME/.tmux.conf'


##################################################
# RRS
##################################################

alias news='newsboat'



##################################################
# Files to server
##################################################

    #rsync -alPvz ./source_dir server.com:destination_dir


##################################################
# Youtube-dl
##################################################

alias yoump3='youtube-dl -x --audio-format mp3'

alias you='youtube-dl'

##################################################
# Torrent Transmission-deamon
##################################################

alias t.start="transmission-daemon"

alias t.add ="transmission-remote -a"

alias t.l="transmission-remote -l"

alias t.rm="transmission-remote -t"

alias t.web="open -a firefox http://127.0.0.1:9091/"

alias t.exit="transmission-remote --exit"


##################################################
# Todo.txt
##################################################

# short
alias t="todo.sh"

# list projects
alias tp="todo.sh lsprj"


##################################################
# Neomutt
##################################################

alias mail="neomutt"


##################################################
# Weather
##################################################

#alias weather='curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Hayward}"'


##################################################
# Scripts
##################################################

# move files to server
alias move='python3 /Users/vt/notes/code/scripts/move_files_to_server.py'

##################################################
# Server
##################################################

alias server='sftp vt@10.216.1.57'

