#!/usr/bin/env bash

SELECTION=$(cat "$HOME/.dotfiles/templates/emoji.txt" | rofi -dmenu -p "" -matching fuzzy -sort)

if [ -z "${SELECTION-}" ]; then
    exit 0
fi

EMOJI=$(echo $SELECTION | cut -d " " -f1)
echo $EMOJI | xclip -selection clipboard
notify-send  "Emoji copied: $EMOJI"
