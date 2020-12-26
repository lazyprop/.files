# ~/.bash_profile

# defaults
export BROWSER="brave"
export READER="zathura"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export TERM="termite"

# ~/ cleanup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LESSHISTFILE=-
#export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonstartup"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/xauthority"

export PATH="$PATH:$HOME/.local/bin:$XDG_DATA_HOME/cargo/bin"

[[ -f ~/.bashrc ]] && . ~/.bashrc

startx $XINITRC
setxkbmap -option caps:escape
