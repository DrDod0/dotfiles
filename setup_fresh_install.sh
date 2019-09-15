# !/bin/bash
# Author: @veggietorta
# Update: 09.15.19
# Purpose: Installing tools on a fresh install

#############################
#exec 3>&1 4>&2
#trap 'exec 2>&4 1>&3' 0 1 2 3
#exec 1>log.out 2>&1
###### Everything below will be logged at log.out


###############################

# TODO [] linux install
# TODO [] osx (homebrew) install
# TODO [] remove keyboard promp
# TODO [] remove ZSH not install promp

ask_user()
    {
    echo "What action would you like to take?

            a. *essential_actions

            1.  ubuntu_maintance
            2.  mosh_install
            3.  *vim_install
            4.  *git_install
            5.  sqlite_install
            6.  todo_txt_install
            7.  *tmux_install
            8.  *ranger_install
            9.  *pip3_install
            10.  powerline_shell_install
            11.  pip_install_black
            12.  pip_install_flake8
            13. *remove_junk
            14. *python3_install
            15. *fzf_install
            16.  time_adjustment
            17.  dropbox_install
            18. *neovim_install
            19.  newsboat_install
            20.  mutt_install
            21. *neofetch_install
            22. *vundle_plugin_install
            23. *curl_install
            24.  scim_install
            25. *zsh_install
            26. *dotfiles_symbolic_links
            27.  exit_out

    "
    read user_answer

    case "$user_answer" in
        a) essential_actions;;
        1) ubuntu_maintance;;
        2) mosh_install;;
        3) vim_install;;
        4) git_install;;
        5) sqlite_install;;
        6) todo_txt_install;;
        7) tmux_install;;
        8) ranger_install;;
        9) pip3_install;;
        10) powerline_shell_install;;
        11) pip_install_black;;
        12) pip_install_flake8;;
        13) remove_junk;;
        14) python3_install;;
        15) fzf_install;;
        16) time_adjustment;;
        17) dropbox_install;;
        18) neovim_install;;
        19) newsboat_install;;
        20) mutt_install;;
        21) neofetch_install;;
        23) vundle_plugin_install;;
        23) curl_install;;
        24) scim_install;;
        25) zsh_install;;
        26) dotfiles_symbolic_links;;
        27) exit_out;;
    esac

    }


# Group Actions ##################################################################

essential_actions()
    {
    	zsh_install
        vim_install
        neovim_install
        vundle_plugin_install
        tmux_install
        ranger_install
        python3_install
        fzf_install
        neofetch_install
        curl_install
        remove_junk
        dotfiles_symbolic_links

        echo The essentials have been installed
        ask_user
    }



# Individual Actions ###################################################################

dotfiles_symbolic_links()
    {
    # clone repo
    cd ~/
    git clone https://github.com/VeggieTorta/dotfiles.git

    # run symbolic link script
    sh ~/dotfiles/links.bash.sh

    }


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
    apt remove nano -y

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

    # Check for OS installed
    if [ "$(uname)" = Darwin ]
    then
        #OSX Install, assumes homebrew has already been installed
        # TODO [] Add condition to check for homebrew being installed

        # folder structure
        cd ~/.config
        mkdir .mutt
        mkdir .mail
        mkdir alias
        mkdir cache
        mkdir certificates
        mkdir mailcap
        mkdir sig
        mkdir temp
        cd ~/.config/cache
        mkdir bodies
        mkdir headers

        # Install mutt via homebrew
        cd
        brew install mutt

    elif [ "$(uname)" = Debian ]
    then
        # Assumes if OSX isn't installed then Ubuntu is installed
        # TODO [] add condition to check for Ubuntu install

        # folder structure
        cd ~/.config
        mkdir .mutt
        mkdir .mail
        mkdir alias
        mkdir cache
        mkdir certificates
        mkdir mailcap
        mkdir sig
        mkdir temp
        cd ~/.config/cache
        mkdir bodies
        mkdir headers

        #Ubunut Install
        apt-get install mutt -y

    else
        echo "your system isn't supported, this script is only for OSX & Ubuntu"
    fi

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


curl_install()
    {
    # install
    	apt-get install curl -y

    }

scim_install()
    {
    # Install dependencies
	cd $HOME
        sudo apt-get install bison libncurses5-dev libncursesw5-dev libxml2-dev libzip-dev
    # Github clone
    	git clone https://github.com/jmcnamara/libxlsxwriter.git
    	cd libxlsxwriter/
    	make
    	sudo make install
    # refresh dynamic l ink library
    	sudo idconfig
    # Download and compiling sc-im
    	cd ..
    	git clone https://github.com/andmarti1424/sc-im.git sc-im/src
    	cd sc-im/src
    	make
    	sudo make install

    }

zsh_install()
    {

    # Install
    apt-get install zsh -y

    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # Set zsh as defautl shell in ubuntu
    chmod -s /usr/bin/zsh

    # remove oh-my-zsh and zsh default config
    rm ~/.zsrch
    rm ~/.shell.pre-oh-my-zsh

    # reload shell
    zsh



    }

exit_out()
    {
    exit
    }

#####################################

# [A] System essentials
#     ubuntu_maintance
#     python3_install
#     git_install
#     pip3_install
#     ranger_install
#     curl_install
#
# # [B] Editor & Like
#     vim_install
#     neovim_install
#     tmux_install
#     vundle_plugin_install
#     pip_install_black
#     pip_install_flake8
#
# # [C] Random
#     newsboat_install
#     mutt_install
#     #scim_install
# # [Z] Terminal Flash & low priority
#     neofetch_install
#     remove_junk
#     #powerline_shell_install
#
# # sqlite_install
# # mosh_install
# # todo_txt_install
# fzf_install
# time_adjustment
# # dropbox_install
# # clone_notes_repo

#####################################

ask_user
