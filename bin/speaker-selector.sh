#!/usr/bin/env bash

CURRENT=$(pactl get-default-sink | cut -d . -f2)
OPTIONS=$(pactl list short sinks | cut -f2 | grep -v "$CURRENT")
LENGTH=$(echo "$OPTIONS" | wc -l)

if [[ "$LENGTH" == 1 ]]; then
  SELECTED=$OPTIONS
else
  echo "$OPTIONS"
  SELECTED=$(echo -e "$CURRENT\n$OPTIONS" | rofi -dmenu -i -p "🔉" -matching fuzzy -sort -select $CURRENT)
fi

if [ -z "$SELECTED" ]; then
  exit 0
fi

pactl set-default-sink $SELECTED
notify-send -i /usr/share/icons/Papirus-Dark/16x16/actions/speaker.svg "Speaker Changed" $(echo $SELECTED | cut -d . -f2) -h string:synchronous:speaker
canberra-gtk-play -i message -d "Speaker Changed"
pkill -SIGRTMIN+10 i3blocks
