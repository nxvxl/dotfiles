#!/usr/bin/env bash

if [[ ${1} = "up" ]]; then
	pactl set-sink-mute @DEFAULT_SINK@ false
	pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [[ ${1} = "down" ]]; then
	pactl set-sink-mute @DEFAULT_SINK@ false
	pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [[ ${1} = "toggle" ]]; then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

sleep 0.1s
pkill -SIGRTMIN+10 i3blocks
