# Author: @veggietorta
# Last updated: 10.02.19

# Linux: ~/.config/qutebroswer/config.py
# OSX: ~/.qutebrowser/config.py




# Autoload autoconfig.yml
config.load_autoconfig()


# Search Engines
{"DEFAULT": "https://duckduckgo.com/?q={}", "yt": "https://www.youtube.com/results?search_query={}"}


# Keybinding:
config.bind(';m', 'hint links userscript ~/.qutebrowser/script_yt')



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


# No-Script-like behavior
# disable Javascript by default
#set content.javascript.enabled false

# Play youtube videos with mpv
#bind ,m spawn mpv {url}
#bind ,M hint links spawn mpv {hint-url}
config.bind('m', 'spawn mpv {url}')
