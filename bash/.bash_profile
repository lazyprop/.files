#
# ~/.bash_profile
#


export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin"

[[ -f ~/.bashrc ]] && . ~/.bashrc

#~/.bashrc
startx
setxkbmap -option caps:escape
