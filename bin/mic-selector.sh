#!/usr/bin/env bash

readarray -d "." -t CURRENT <<< $(pactl get-default-source)
SELECTED=$(pactl list short sources | grep input | cut -f2 | rofi -dmenu -i -p "Microphone Input (${CURRENT[1]})" -matching fuzzy -sort)

if [ -z "$SELECTED" ]; then
  exit 0
fi

pactl set-default-source $SELECTED
