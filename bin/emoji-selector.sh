#!/usr/bin/env bash

SELECTION=$(cat "$HOME/.dotfiles/templates/emoji.txt" | rofi -dmenu -p "" -matching fuzzy -sort)

if [ -z "${SELECTION-}" ]; then
    exit 0
fi

EMOJI=$(echo $SELECTION | cut -d " " -f1)

if [ -x "$(command -v xclip)" ]; then
  echo -n $EMOJI | xclip -selection clipboard
  notify-send  "Emoji copied via xclip: $EMOJI"
elif [ -x "$(command -v xsel)" ]; then
  echo -n $EMOJI | xsel -b
  notify-send  "Emoji copied via xsel: $EMOJI"
fi
