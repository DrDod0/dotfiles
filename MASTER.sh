# !/bin/bash
#############################
#exec 3>&1 4>&2
#trap 'exec 2>&4 1>&3' 0 1 2 3
#exec 1>log.out 2>&1
###### Everything below will be logged at log.out

# Autor: VeggieTorta
# Created: 01.26.19
# Update: 02.26.19
# Purpose: Setup box with tools enjoyed.



###############################


ubuntu_maintance()
    {
    # No if/then statement added, OS updt will always be preformed
    # update
        apt-get update -y
    # upgrade
        apt-get dist-upgrade -y
    # remove old shit
        apt-get remove -y
    }

mosh_install()
    {
    # Install
    if [ -x "$(command -v mosh)" ]
    then
        echo 'mosh already installed'
    else
        apt-get install mosh -y
        echo 'mosh not found, installing'
    fi
    }

vim_install()
    {
    # Add vim repo & install
    sudo add-apt-repository ppa:jonathonf/vim -y
    apt update -y
    apt install vim -y
    echo 'vim repo added and installed.'

    # Make vim default editor, eat shit nano
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100
    echo 'vim made the default editor'
    }

git_install()
    {
    # check if command gitexist
    if [ -x "$(command -v git)" ]
    then
        echo 'git already installed'
    else
    # Install
        apt-get install git-core -y
        echo 'got not found, installed'
    fi
    }

sqlite_install()
    {
    if [ -x "$(command -v sqlite)" ]
    then
        echo 'sqlite already installed'
    else
    # Install
        apt-get install sqlite -y
        echo 'sqlite note found, installing.'
    fi
    }

todo_txt_install()
    {
    if [ -x "$(command -v todo-text -h)" ]
    then
        echo 'todo.txt already installed'
    else
    # Install
        apt-get install todotxt-cli
        echo 'todo.txt not found, installing'
    fi
    }

tmux_install()
    {
    if [ -x "$(command -v tmux )" ]
    then
        echo 'tmux already installed'
    else
    # Install latest version from github repo
        # Install dependencies
            sudo apt install -y automake
            sudo apt install -y build-essential
            sudo apt install -y pkg-config
            sudo apt install -y libevent-dev
            sudo apt install -y libncurses5-dev

        # remove /tmp/tmux in case it exist
            rm -fr /tmp/tmux

        # clone tmux repo from github to /tmp/tmux
            git clone https://github.com/tmux/tmux.git /tmp/tmux

        # enter /tmp/tmux directory
            cd /tmp/tmux

        # git command to check out master branch
            git checkout master

        sh autogen.sh

        ./configure && make

        sudo make install

        cd -
    fi

    # Install tmux plugin manager
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    }

ranger_install()
    {
    # Install
        if [ -x "$(command -v ranger)" ] # check if command 'ranger' exist
        then
            echo 'ranger is already installed'
        else
            apt-get install ranger -y
        fi
    }

pip3_install()
    {
    apt-get install python3-pip -y
    }

powerline_shell_install()
    {
    # Install powerline
    pip3 install powerline-shell

    # add git status to powerline
    pip3 install --user powerline-gitstatus
    }

pip_install_black()
    {
    pip install black
    }

pip_install_flake8()
    {
    pip install flake8 -y
    }

remove_junk()
    {
    apt-get remove nano
    }


python3_install()
    {
        # check OS, if ubuntu or OSX upgrade
        apt-get upgrade python3 -y

        # if OS is not Ubuntu or OSX install
    }

fzf_install()
    {
    if [ -x "$(command -v fzf)" ]
    then
        echo 'fzf is already installed'
    else
    # clone repo
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

    # Install command and answer yes for all questions
        yes Y | ~/.fzf/install
    fi
    }

time_adjustment()
    {
    # Adjust time zone, good to do when setting up a node in another time zone
    dpkg-reconfigure tzdata
    }

dropbox_install()
    {
    # check if dropbxo is installed.
    if [ -x "$(command -v ~/dropbox.py status)" ]
    then
        echo 'dropbox is already installed'
    else
    # Install home directory
        cd ~
        curl -LO https://www.dropbox.com/download?dl=packages/dropbox.py
    # make file executable
        chmod +x ~/dropbox.py
    # Dropbox CLI expects ~/.dropbox-dis to contain your Dropbox installation
        ln -s /opt/dropbox ~/.dropbox-dist
    # start Dropbox
        ~/dropbox.py start -i -y
    # Turn off automatic LAN sync
        ~/dropbox.py lansync n
    # Exclude directories from sync
        ~/dropbox.py exclude add -/Dropbox/camera_uploads
        ~/dropbox.py exclude add -/Dropbox/Fonts
        ~/dropbox.py exclude add -/Dropbox/Interviews
        ~/dropbox.py exclude add -/Dropbox/Magazines
        ~/dropbox.py exclude add -/Dropbox/sounds_effects
        ~/dropbox.py exclude add -/Dropbox/Back-Ups
        ~/dropbox.py exclude add -/Dropbox/Books
        ~/dropbox.py exclude add -/Dropbox/OSX
    # readout excluded list
        ~/dropbox.py exclude list
    fi
    }

neovim_install()
    {
    #repo
    add-apt-repository ppa:neovim-ppa/stable

    #install
    apt-get install neovim -y
    }

newsboat_install()
    {
    #install
    apt-get install newsboat -y
    }

mutt_install()
    {
     #Install
     apt-get install mutt -y
    }

neofetch_install()
    {
    #install
    apt-get install neofetch -y
    }

vundle_plugin_install()
    {
    #install
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    #install Plugins from command line
    vim +PluginInstall +qall
    }


OS_check()
    {
    set -x #
    $UNAME
    #if [[ $uname == 'Linux' ]]
    #then
    #    echo hello
    #else
    #    echo no clue
    #    set -x
    #    echo $uname
    #    set +x

    #fi
    }

curl_install()
    {
    apt-get install curl -y
    }

#####################################
# [A] Ubuntu / OSX /
    # OS_check

# [A] System essentials
    ubuntu_maintance            # tested
    python3_install             # tested * errors out from unclean source tree, only a problem when rerunning.
    git_install                 # tested
    pip3_install
    ranger_install              # tested
    curl_install

# [B] Editor & Like
    vim_install                 # tested
    neovim_install
    tmux_install                # tested
    vundle_plugin_install
    pip_install_black
    pip_install_flake8

# [C] Random
    newsboat_install
    mutt_install

# [Z] Terminal Flash & low priority
    neofetch_install
    #powerline_shell_install
    remove_junk

# sqlite_install            # tested
# mosh_install              # tested
# todo_txt_install          # tested
fzf_install               # tested
# time_adjustment           # tested
# dropbox_install
# clone_notes_repo

#####################################

# Adios motherfuckers
exit
