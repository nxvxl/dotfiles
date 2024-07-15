function h
  set -l SELECTED (history | fzf-tmux -p)
  if test "$SELECTED"
    eval "$SELECTED"
  end
end
