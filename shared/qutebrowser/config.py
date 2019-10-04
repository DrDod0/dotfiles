# Author: @veggietorta
# Last updated: 10.02.19

# Linux: ~/.config/qutebroswer/config.py
# OSX: ~/.qutebrowser/config.py



# Autoload autoconfig.yml
config.load_autoconfig()

# Start qutebrowser in private mode
    #open -p



# The directory to save downloads
c.downloads.location.directory = "~/Downloads"

# Leave insert mode if a non-editable element is clicked.
c.input.insert_mode.auto_leave = True

# Automatically enter insert mode if an editable element is focused after loading the page.
c.input.insert_mode.auto_load = True


# Search Engines
{"DEFAULT": "https://duckduckgo.com/?q={}", "yt": "https://www.youtube.com/results?search_query={}"}


# The page(s) to open at the start.
c.url.start_pages = "https://duckduckgo.com/?={}/"



# Keybinding:
    #config.bind(';m', 'hint links userscript ~/.qutebrowser/script_yt')
config.bind("Cmd+q", "wq")


# CSS Themes
#set content.user_stylesheets draculized-reddit.com.css

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
