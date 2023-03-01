#!/usr/bin/env bash

readarray -d "." -t CURRENT <<< $(pactl get-default-sink)
SELECTED=$(pactl list short sinks | cut -f2 | rofi -dmenu -i -p "Speaker Output (${CURRENT[1]})" -matching fuzzy -sort)

if [ -z "$SELECTED" ]; then
  exit 0
fi

pactl set-default-sink $SELECTED
