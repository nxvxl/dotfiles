if [[ -d /home/mnm/.local/bin ]]; then
  PATH="/home/mnm/.local/bin:$PATH"
fi

if [[ -d /home/mnm/.dotfiles/bin ]]; then
	PATH="/home/mnm/.dotfiles/bin:$PATH"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=nvim
export LC_TIME="en_US.UTF-8"


# alias
alias xc="xclip -selection clipboard"