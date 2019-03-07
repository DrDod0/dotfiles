#! /usr/bin/python3.6
# Author: veggietorta
# Contact: @veggietorta
# Init: 03.07.19
# Updtd: 03.07.19

from subprocess import call


def ask_user():
    print('test: inside of def ask_user')
    user_input = input(''' Type name of program to install or action':\n
                           vim
                           neovim
                           ranger
                           tmux
                           newsboat
                           git
                           pip3
                           pip black
                           flake8
                           python3
                           fzf
                           dropbox
                           curl

                           exit
                           ''')
    return user_input
    print('test: leaving ask_user')


def find_user_input(user_input):

    # 'call' calls on $SHELL to search for the path of a program.
    # $ which {user_input}.
    # example: $ which vim.
    # example readout: /user/bin/vim

    search = call(["which", user_input])

    # Search for program in predefined path /usr/bin/{user_input}
    # if {user_input} matches program_known set-up symbolink & notify user
    # if {user_input} DID NOT matche program_known, no action & notify user

    if '/usr/bin/' + user_input == search:
        print(user_input + 'already installed, no action taken.')

    elif user_input == 'exit':
        let_me_out

    else:
        print(user_input + 'not on system, installing program.')
        print('lets pretend i just installed something')


def let_me_out():
    print('Bye.')
    exit()


#################################
print('Test: asking to be sent to ask_user')
ask_user()
find_user_input(user_input)
