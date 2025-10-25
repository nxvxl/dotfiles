function workspace
  set -l DIR ~/Works/Vouch/Repository
  set -l SELECTED (find "$DIR" -mindepth 1 -maxdepth 1 -type d | xargs basename -a | fzf)

  if test "$SELECTED"
    cd "$DIR/$SELECTED"
    commandline -f repaint
  end
end
