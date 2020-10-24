#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias dots="~/dotfiles"
alias ttrv="ttrv --enable-media"

eval "$(thefuck --alias)"

# replace coreutils with rust alternatives
alias cat="bat"
alias ls="exa"
#alias find="fd"
#alias grep="rg"
alias rm="trash"
