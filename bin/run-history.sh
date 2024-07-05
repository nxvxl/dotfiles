#!/usr/bin/zsh

SELECTED=`cat ~/.zsh_history | fzf`
if [[ "$SELECTED" != "" ]]; then
  eval "$SELECTED"
fi
