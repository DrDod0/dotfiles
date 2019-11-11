

###################################################
# Fzf

function ff
    #vim (FZF)
    vim ~/dotfiles ~/notes (FZF)
end

#fzf --preview="bat {} --color=always"

###################################################
# vim keybindings

function fish_user_key_bindings
  fish_vi_key_bindings
end



###################################################
# System

function q
    exit
end


function v
    vifm
end


function c
    clear
end

function l
    exa -lahF
end


#################################################
# Locations

function code # code
    cd ~/notes/code/
end


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

function gs # gs
   git status
end


function gc # gc
   git commit -message
end


function gp # gp
   git push
end


function ga # ga
   git add -A
end


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


function tl
    tmux ls
end


function td
    tmux detach
end


function ta
    tmux attach
end


function tk
    tmux kill-server
end


function tu
    tmux
end


function source.tmux
    tmux source-file $HOME/.tmux.conf
end

##################################################
# RRS

function news
    newsboat
end


##################################################
# Youtube-dl

function yoump3
    youtube-dl -x --audio-format mp3
end


function you
    youtube-dl
end

##################################################
# Torrent Transmission-deamon


function t.start
    transmission-deamon
end


function t.add
    transmission-remote -a
end


function t.l
    transmission-remote -l
end


function t.rm
    transmission-remote -t
end


function t.web
    open -a firefox http://127.0.0.1:9091/
end


##################################################
# Weather

#function weather
#    curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Hayward}"
#end
