Author: @veggietorta
Update: 02.10.21
System: Ubuntu 20.10
Purpose: Install programs and system files required to install other installs

# curl
# check if curl is installed
# if installed log and move on
# if not installed, install curl and log

if [ -x "$(command -v curl)" ]
  then
  echo "curl installed"
  # log it
else
  sudo apt install curl -y
  # log it
fi


# git
# check if git is installed
# if installed log  and move on
# if not installed, install and set-up config files

if [ -x "$(command -v git" ]
  then
  echo "git installed"
  # logt it
else
  sudo apt install git-all -y
  git config --global user.name "vt"
  git config --global user.email "vt@vt.com"
  # log it
fi


# xclip
# check if xclip is installed
# if installed log and move on
# if not installed, install and set-up config files

if [ -x "$command -v xclip" ]
  then
  echo "xclip installed"
  # log it
else
  sudo apt install xclip -y
  # log it
fi

