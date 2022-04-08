if [[ -d $HOME/.local/bin ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d $HOME/.dotfiles/bin ]]; then
	PATH="$HOME/.dotfiles/bin:$PATH"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=nvim
export LC_TIME="en_US.UTF-8"


# alias
alias xc="xclip -selection clipboard"
