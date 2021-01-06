#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -la'
PS1='[\u@\h \W]\$ '
alias term='$TERM &'
alias r='ranger'
alias qs='scheme --quiet < '

alias dots="~/dotfiles"
alias ttrv="ttrv --enable-media"

eval "$(thefuck --alias)"

# replace coreutils with rust alternatives
alias cat="bat"
alias ls="exa"
#alias find="fd"
#alias grep="rg"
alias rm="trash"

# map ctrl+bksp to delete previous word
# stty werase undef
bind '"\b":backward-kill-word'
alias cp="/usr/local/bin/advcp -g -r"
alias mv="/usr/local/bin/advmv -g"

alias sshsync="rsync -av --progress -e 'ssh -p 2222'"

# cleanup ~/
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

export MANPAGER='nvim +Man!'
