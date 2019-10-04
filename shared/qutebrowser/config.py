# Author: @veggietorta
# Last updated: 10.04.19
# Linux: ~/.config/qutebroswer/config.py
# OSX: ~/.qutebrowser/config.py



####################
# General Settings #
####################


# Autoload autoconfig.yml
config.load_autoconfig()

# The directory to save downloads
c.downloads.location.directory = "~/Downloads"

# Leave insert mode if a non-editable element is clicked.
    #c.input.insert_mode.auto_leave = True

# Automatically enter insert mode if an editable element is focused after loading the page.
    #c.input.insert_mode.auto_load = True

# No-Script-like behavior, disable Javascript by default
    #:set content.javascript.enabled false

# Play youtube videos with mpv
    #bind ,m spawn mpv {url}
    #bind ,M hint links spawn mpv {hint-url}
    #config.bind('m', 'spawn mpv {url}')


##################
# Search Engines #
##################


# Default Search
{"DEFAULT": "https://duckduckgo.com/?q=!{}"}

# The page(s) to open at the start.
c.url.start_pages = "https://duckduckgo.com/?={}/"

# !youtube from duckduckgo bangs
config.bind("y", "set-cmd-text -s :open !youtube")

# !reddit from duckduckgo bangs
config.bind("r", "set-cmd-text -s :open !reddit")

# Open new tab and search using DuckDuckGo
config.bind("t", "set-cmd-text -s :open -t !ddg")

# Start qutebrowser in private mode
config.bind("pp", "set-cmd-text -s :open -p !ddg")



################
#  Keybinding: #
################


#config.bind(';m', 'hint links userscript ~/.qutebrowser/script_yt')
config.bind("Cmd+q", "wq")


#switch tabs
config.bind('ctrl+n', 'tab-next')
config.bind('ctrl+p', 'tab-prev')



################
#  CSS Themes  #
################


#set content.user_stylesheets draculized-reddit.com.css


########################
#  Qutebrowser Themes  #
########################


# Dracula Theme:
    #import dracula.draw
    #dracula.draw.blood(c, {
    #    'spacing': {
    #        'vertical': 6,
    #        'horizontal': 8
    #    },
    #    'font': {
    #        'family': 'Menlo, Terminus, Monaco, Monospace',
    #        'size': 10
    #    }
    #})




