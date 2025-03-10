#!/usr/bin/env bash

DIR=`find $1 -mindepth 1 -maxdepth 1 -type d | xargs basename -a | sort -r | fzf-tmux -p`

if [ -n "$DIR" ]; then
	clear
	cd "${1%/}/$DIR"
fi
