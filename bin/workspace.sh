#!/usr/bin/env bash

DIR=`ls $1 | fzf`

if [ -n "$DIR" ]; then
	clear
	cd "$1/$DIR"
fi
