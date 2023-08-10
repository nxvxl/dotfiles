#!/usr/bin/env bash

ICON=/usr/share/icons/Papirus-Dark/16x16/actions/

function usage {
echo "You can call this script like this:
\$ ./volume.sh up
\$ ./volume.sh down
\$ ./volume.sh mute"
}

function get_volume {
  amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
  amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
  volume=`get_volume`
  notify-send -i "${ICON}audio-volume-high.svg" -u normal "Volume" -h int:value:$volume -h string:synchronous:volume
}

function play_sound {
  canberra-gtk-play -i bell -d "volume changed"
}

case $1 in
  up)
    # Set the volume on (if it was muted)
    amixer set Master on > /dev/null
    # Up the volume (+ 5%)
    amixer sset Master 5%+ > /dev/null
    send_notification
    ;;
  down)
    amixer set Master on > /dev/null
    amixer sset Master 5%- > /dev/null
    send_notification
    ;;
  mute)
    # Toggle mute
    amixer set Master 1+ toggle > /dev/null
    if is_mute ; then
      notify-send -i "${ICON}audio-volume-muted.svg" "Volume" "Muted" -h string:synchronous:volume
    else
      send_notification
    fi
    ;;
  *)
    usage
    ;;
esac

sleep 0.1s
pkill -SIGRTMIN+10 i3blocks
