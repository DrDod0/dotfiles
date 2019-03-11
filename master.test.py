# !/usr/bin/python3.6
# Author: veggietorta
# Contact: @veggietorta
# Init: 03.07.19
# Updtd: 03.11.19

import os
from subprocess import call


def ask_user():
    os.system('clear')
    user_input = input(''' Type name of program to install or action :\n
            vimi        neovim      ranger      tmux
            newsboat    git         pip3        pip black
            flake8      python3     fzf         dropbox
            curl

            TODO virtualen, fail2ban
            ---------------------------------------------
            exit

                       ''')
    return user_input


def find_user_input(user_input):
    print("I'm inside the find_user_input function")
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
ask_user()
find_user_input(user_input)


## fail2ban
Install:
apt-get install fail2ban

start fail2ban:
sudo systemctl start fail2ban

enable fail2ban:
sudo systemctl enable fail2ban

Configure Jail:
    create config:
        touch /etc/fail2ban/jail.local
        echo >
            [sshd]
            enabled = true
            port ########
            filter = sshd
            logpath = /var/log/auth.log
            maxretry = 3

restart fail2ban
    sudo systemctl restart fail2ban




