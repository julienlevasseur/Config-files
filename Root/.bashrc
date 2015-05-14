# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Set timezone to Montreal :
export TZ='America/Montreal'

export EDITOR='vim'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# Other aliases :
alias vim='/usr/local/bin/vim'
alias vi='vim'
alias grep='grep --color=auto'
alias rsync='rsync -var --progress'
alias apt-search='apt-cache search'

export PS1='\[\e[0;36m\]\T \d \[\e[1;37m\][\[\e[1;31m\]\u@\H\[\e[1;37m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;31m\]+${SHLVL}\[\e[1;37m\]] \[\e[1;33m\]\w\[\e[0;37m\] \$ \n'
#export PYTHONPATH="/usr/local/lib/python2.7:/usr/local/lib/python2.7/dist-packages"
export PYTHONPATH="/usr/local/lib/python2.7:/usr/local/lib/python2.7/dist-packages:/usr/lib/python2.7/dist-packages"
echo -e "\e[0;101munset PYTHONPATH if need to work with APT !\e[0m"
echo " "
