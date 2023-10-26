#!/usr/bin/env bash

ICON=/usr/share/icons/Papirus-Dark/16x16/actions/

function usage {
echo "You can call this script like this:
\$ ./backlight.sh up
\$ ./backlight.sh down"
}

function get_value {
  xbacklight -get | xargs printf "%.0f\n"
}

function send_notification {
  value=`get_value`
  notify-send -i "${ICON}brightnesssettings.svg" -u normal "Brightness ${value}%" -h int:value:$value -h string:synchronous:brightness
}

case $1 in
  up)
    xbacklight -inc 10
    send_notification
    ;;
  down)
    xbacklight -dec 10
    send_notification
    ;;
  *)
    usage
    ;;
esac

sleep 0.1s
pkill -SIGRTMIN+11 i3blocks
