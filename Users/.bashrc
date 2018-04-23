# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export EDITOR=vim

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
    export PS1='\[\e[0;36m\]\T \[\e[1;37m\][\[\e[1;32m\]\u@\H\[\e[1;37m\]:\[\e[0;37m\]\[\e[0;32m\]+${SHLVL}\[\e[1;37m\] \[\e[1;34m\]$(parse_git_branch) \[\e[1;35m\]${profile_name}\[\e[0;37m\] ] \[\e[1;33m\]\w\[\e[0;37m\] \$ \n'
else
    export PS1='\[\e[0;36m\]\T \[\e[1;37m\][\[\e[1;32m\]\u@\H\[\e[1;37m\]:\[\e[0;37m\]\[\e[0;32m\]+${SHLVL}\[\e[1;37m\] \[\e[1;34m\]$(parse_git_branch) \[\e[1;35m\]${profile_name}\[\e[0;37m\] ] \[\e[1;33m\]\w\[\e[0;37m\] \$ \n'
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #export PS1='\[\e[0;36m\]\T \d \[\e[1;37m\][\[\e[1;32m\]\u@\H\[\e[1;37m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;37m\]] \[\e[1;33m\]\w\[\e[0;37m\] \$ \n'
    export PS1='\[\e[0;36m\]\T \[\e[1;37m\][\[\e[1;32m\]\u@\H\[\e[1;37m\]:\[\e[0;37m\]\[\e[1;37m\]\[\e[1;34m\]$(parse_git_branch) \[\e[1;35m\]${profile_name}\[\e[0;37m\] ] \[\e[1;33m\]\w\[\e[0;37m\] \$ \n'
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias lt='ls -lrt'
alias lZ='ls -lZ'
alias rsync='rsync -var --progress'
# Git :
alias gadd='git add'
alias gcom='git commit -m'
alias gps='git push'
# Leatherman :
if [ -d "/opt/leatherman" ]; then
  export PATH=$PATH:~/repos/bitbucket/leatherman
  alias cloud='leatherman cloud'
fi
alias kitchen='chef exec kitchen'
alias inspec='chef exec inspec'

alias ssh_hosts="grep 'Host ' ~/.ssh/config|awk '{print $2}\'|sort"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Load in the git branch prompt script.
source ~/.git-prompt.sh

# Golang :
if [ -d "$HOME/.go" ]; then
  export GOPATH=$HOME/.go:$HOME/repos/github/hcl-lint
  export GOBIN=$HOME/.go/bin
  export PATH=$PATH:$GOBIN
fi

# Terraform :
if [ -d "/opt/terraform" ]; then
  export PATH=$PATH:/opt/terraform
  alias tflint='terraform fmt -check=true -write=false -diff=true'
fi

# Nomad :
if [ -d "/opt/nomad" ]; then
  export PATH=$PATH:/opt/nomad
fi

# Consul :
if [ -d "/opt/consul" ]; then
  export PATH=$PATH:/opt/consul
fi

# Packer :
if [ -d "/opt/packer" ]; then
  export PATH=$PATH:/opt/packer
fi

# Vault :
if [ -d "/opt/vault" ]; then
  export PATH=$PATH:/opt/vault
  export VAULT_ADDR='http://127.0.0.1:8200'
fi

# Minikube :
if [ -d "/opt/minikube" ]; then
  export PATH=$PATH:/opt/minikube
fi
