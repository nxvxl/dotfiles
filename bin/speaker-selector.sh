#!/usr/bin/env bash

CURRENT=$(pactl get-default-sink | cut -d . -f2)
OPTIONS=$(pactl list short sinks | cut -f2 | grep -v $CURRENT )

SELECTED=$(echo "$OPTIONS" | rofi -dmenu -i -p "Speaker Output ($CURRENT)" -matching fuzzy -sort)

if [ -z "$SELECTED" ]; then
  exit 0
fi

pactl set-default-sink $SELECTED
notify-send -i /usr/share/icons/Papirus-Dark/16x16/actions/speaker.svg "Speaker Changed" $(echo $SELECTED | cut -d . -f2) -h string:synchronous:speaker
canberra-gtk-play -i message -d "Speaker Changed"
