# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

export NVM_DIR="/home/male/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export JAVA_HOME="/usr/java/latest"

export BITPATH=/opt/bitcoin-0.15.1-x86_64-linux-gnu/bitcoin-0.15.1/bin
export PATH=$PATH:$BITPATH


####### cross compiled gcc ########
export PRE="/usr/local/i386elfgcc"
export TARGET=i386-elf
export PATH="$PRE/bin:$PATH"

export CC=/usr/bin/gcc
export LD=/usr/bin/gcc


if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi
########## ALIASES ##########

alias servidor='cd /media/LinArchivos/Servidor'
alias facu='cd /media/LinArchivos/FACU'
alias tree='tree -C'
alias proy='cd ~/Documents/Pruebas\ Generales/'
alias tra='cd ~/Documents/Trabajo'
alias doc='cd ~/Documents'



######## howdoi #######
alias h='function hdi(){ howdoi $* -c -n 3; }; hdi'

######### QEMU #########
alias qemu='qemu-system-i386'




##GIT ALIASES
alias ga='git add .'
alias gm='git commit'
alias gp='git push'
alias gt='ga && gm && gp '
alias gis='git status'
alias gb='git checkout'


## VIRTUAL ENVS PYTHON
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python36'
source /usr/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/male/.sdkman"
[[ -s "/home/male/.sdkman/bin/sdkman-init.sh" ]] && source "/home/male/.sdkman/bin/sdkman-init.sh"
