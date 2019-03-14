# CLI twitter:
    # https://sferik.github.io/t/

# created script to see all programs installed and versions

# instructions on installing ruby gem, which is needed for tmuxinator
    # apt-get install rubygem -y
    # gem install tmuxinator
    # set up configs

# update server local time
rm /etc/localtime/ 
ln -s /usr/share/zoneinfo/US/Pacific-New /etc/localtime
reference https://www.designhaven.co.uk/2014/10/update-server-timedate-linux-command-line-ssh/

# TODO for all files in directory
- set up keys for all git repos

# git-config
XXX create git-config file

# VIMRC
- review gitgutter settings, not working as expected

# symbolic_links.sh
- rewrite setting up one function a list, maybe
- test each function
- XXX create function to reload bash
- FIX in osx tmux does not recognize the bash_aliases, outside of tmux okay
- [x] instead of rm a found config file, give user option to replace or keep * going with remove all 
- [x] 02.28.19 XXX add echo readout to all functions * done
- [x] 02.28.19 create a search function for all aliace if X program not installed, do not set up aliase.* done
- [x] 02.28.19 XXX function to remove directory * done
- [x] 02.28.19 XXX create function to ignore powerline-shell if not installed * done for all
- [X] 02.21.19 FIX line 209 bashrc link not working * corrected function name
- [X] XXX create function to ask user which link to setup

# fail2ban
- create directory for fail2ban
- create local copy, to prevent overwrite on update, cp jail.conf jail.local
- jail.local edits:
    - ignoreip = 127.0.0.1/8 ::1 <MY IP ADD>
    - ipa to see your ipadd
    - unband ip = fail2ban-client se sshd unbandip <IPADD>
    - band ip = fail2ban-client se sshd bandip <IPADD>
- check fail2ban status:system status fail2ban
- check jail status: fail2ban-client status
- restart fail2ban: systemctl restart fail2ban
- apt-get install python iptables' required to use fail2ban
-
# iptables
- sudo iptables -A INPUT -j ACCEPT -p tcp --dport 22 #inbound SSH
- sudo iptables -A INPUT -j ACCEPT -p icmp --icmp-type 8
- sudo iptables -A INPUT -j ACCEPT -p tcp --dport 22 #outbound SSH
- sudo iptables -A INPUT -j ACCEPT -p tcp --dport 80 #outbound websites
- sudo iptables -A INPUT -j ACCEPT -p tcp --dport 443 #outbond websites
- sudo iptables -A INPUT -j ACCEPT -p tcp --dport 53 #outbond DNS
- sudo iptables -A INPUT -j ACCEPT -p udp --dport 53 #outbond DNS
- sudo iptables -A INPUT -j ACCEPT -p udp --dport 123 #outbond NTP
-
# .neomuttrc
- configure for icloud
- setup two-set verification in google * maybe not, a good time to drop google
- setup google password specific for app * maybe not, a good time to drop google
- setup icloud password specific for apph

# neofetch
[X]- config

# Zshrc
[X] setup with aliases

# powerline
[X]- config
[x]- create a minimal powerline * moved away from powerline, no longer needed

# ranger
[X] pull configuration files into dotfiles directory
[X] symbolic link configuration files
[X] update symbolic_link.sh w/ranger info

# neovim
[X] create folder and to place config
[X] pull configuration files into dotfiles directory
[X] symbolick link configuration files
[X] update symobolic_link.sh w/neovim info

# vifm
[X] remove vifm directories w/config file, prefer ranger.

# newsboat
[x] move config files into dotfiles directory
[x] updt symbolic_link.sh with newsboat

# tmux.conf
[X] tmux.conf not being read. * file was named as '.tmux.conf' instead of 'tmux.conf'
