# Author: @veggietorta
# Last updated: 10.01.19

# Linux: ~/.config/qutebroswer/config.py
# OSX: ~/.qutebrowser/config.py

import subprocess





# Autoload automatically
config.load_autoconfig()



# Dracula Theme:
import dracula.draw

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    },
    'font': {
        'family': 'Menlo, Terminus, Monaco, Monospace',
        'size': 10
    }
})


# No-Script-like behavior
# disable Javascript by default
#set content.javascript.enabled false

# Play youtube videos with mpv
#bind ,m spawn mpv {url}
#bind ,M hint links spawn mpv {hint-url}
