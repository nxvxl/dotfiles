if [[ -d $HOME/.local/bin ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d $HOME/.dotfiles/bin ]]; then
	PATH="$HOME/.dotfiles/bin:$PATH"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORMTHEME="gtk2"
export EDITOR=nvim
export LC_TIME="en_US.UTF-8"

export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

export GTK_CSD=0
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0

# alias
alias xc="xclip -selection clipboard"
