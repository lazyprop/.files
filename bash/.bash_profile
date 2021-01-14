# ~/.bash_profile

# defaults
export BROWSER="firefox"
export READER="zathura"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export TERM="termite"

# ~/ cleanup
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LESSHISTFILE=-
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonstartup"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/xauthority"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

# locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export PATH="$PATH:$HOME/.local/bin:$CARGO_HOME/bin"

[[ -f ~/.bashrc ]] && . ~/.bashrc

startx $XINITRC
setxkbmap -option caps:escape

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PATH:/home/iv/.dat/releases/dat-14.0.2-linux-x64"
