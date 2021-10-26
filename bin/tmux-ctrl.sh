#!/usr/bin/env bash


WORKSPACE=workspace
WORKDIRS=`find ~/Documents/project -maxdepth 1 -mindepth 1 -type d`

SELECTED=`echo "$WORKDIRS" | fzf`

echo $SELECTED
WINDOW_NAME=`basename $SELECTED`


tmux switch-client -t $WORKSPACE

if [[ $? -eq 0 ]]; then
  exit 0
fi

tmux new-session -c $SELECTED -d -s $WORKSPACE && tmux switch-client -t $WORKSPACE


