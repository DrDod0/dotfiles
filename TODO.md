
# TODO for all files in directory
- set up keys for all git repos
-

# symbolic_links.sh
- rewrite setting up one function a list, maybe
- test each function
- XXX function to remove directory
- instead of rm a found config file, give user option to replace or keep
- XXX create function to reload bash
- XXX create function to ignore powerline-shell if not installed
- XXX add echo readout to all functions
- FIX in osx tmux does not recognize the bash_aliases, outside of tmux okay
- create a search function for all aliace if X program not installed, do not set up aliase.
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

# powerline
[X]- config
- create a minimal powerline

# ranger
[X] pull configuration files into dotfiles directory
[X] symbolic link configuration files
[X] update symbolic_link.sh w/ranger info

# neovim
- create folder and for sh to place config
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
