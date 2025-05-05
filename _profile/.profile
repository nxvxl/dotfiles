xset b off

if [[ -d $HOME/.local/bin ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d $HOME/.dotfiles/bin ]]; then
  PATH="$HOME/.dotfiles/bin:$PATH"
fi

if [[ -d /usr/local/go/bin ]]; then
  PATH="/usr/local/go/bin:$PATH"
fi

if [[ -d $HOME/go/bin ]]; then
  PATH="$HOME/go/bin:$PATH"
fi

export PATH

export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=nvim
export LC_TIME="en_US.UTF-8"
# export XDG_CURRENT_DESKTOP=XFCE

#export GTK_CSD=0
#export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0

# alias
alias xc="xclip -selection clipboard"

if [[ -f $HOME/.secrets ]]; then
  . "$HOME/.secrets"
fi

if [[ -f $HOME/.cargo/env ]]; then
  . "$HOME/.cargo/env"
fi
