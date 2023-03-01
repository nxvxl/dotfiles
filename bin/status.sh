#!/usr/bin/env bash

i3status | while :
do
  read line

  pidof xautolock
  if [[ "$?" == "0" ]]
  then NOLOCK=""
  else NOLOCK="\xF0\x9F\x94\x93 |"
  fi
  echo -e "$NOLOCK $line" || exit 1
done
