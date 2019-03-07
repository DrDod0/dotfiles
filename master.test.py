#! /usr/bin/python3.6

from subprocess import call


def ask_user():

    user_input = input('''Select program to install':\n
                           1. vim
                           2. neovim
                           3. ranger
                           4. tmux
                           5. newsboat
                           6. git
                           7. pip3
                           8. pip black
                           9. flake 8
                          10. python 3
                          11. fzf
                          12. dropbox
                          13. vim vundle plugin manager
                          14. curl
                           x. exit
                           ''')

    # commonly used path
    dot = '$HOME/dotfiles/'   # dotfiles directory
    conf = '$HOME/.config/'   # .config directory

    # TODO FIX
    program_known = '/usr/bin/nvim'

    # 'call' calls on $SHELL to search for the path of a program.
    # $ which {user_input}.
    # example: $ which vim.
    # example readout: /user/bin/vim

    call(["which", user_input])

    # Search for program in predefined path /usr/bin/{user_input}
    # if {user_input} matches program_known set-up symbolink & notify user
    # if {user_input} DID NOT matche program_known, no action & notify user

    if '/usr/bin/' + user_input == program_known:
        print(user_input + ' location matches our known location')

    elif user_input == 'x':
        let_me_out

    else:
        print(user_input + ' not found, no action take')
        ask_user


def let_me_out():
    exit()


#################################
ask_user
