#!/usr/bin/env bash

CURRENT=$(pactl get-default-source | cut -d . -f2)
OPTIONS=$(pactl list short sources | grep input | cut -f2)

SELECTED=$(echo "$OPTIONS" | rofi -dmenu -i -p "🎤" -matching fuzzy -sort -select "$CURRENT")

if [ -z "$SELECTED" ]; then
  exit 0
fi

pactl set-default-source $SELECTED
notify-send -i /usr/share/icons/Papirus-Dark/16x16/devices/audio-input-microphone.svg "Microphone Changed" $(echo $SELECTED | cut -d . -f2) -h string:synchronous:microphone
canberra-gtk-play -i message -d "Speaker Changed"
