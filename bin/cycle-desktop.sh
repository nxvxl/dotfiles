#!/usr/bin/env bash

ARG=$1

if [[ -z "$ARG" ]]; then
  exit
fi

CURRENT_DESKTOP=$(qdbus-qt6 org.kde.KWin /KWin currentDesktop)
NEXT_DESKTOP=""
PREVIOUS_DESKTOP_FILE_PATH="$HOME/.cache/previous_desktop"

echo $ARG $CURRENT_DESKTOP

if [[ "$ARG" == "next" ]]; then
  if [[ "$CURRENT_DESKTOP" == "9" ]]; then
    NEXT_DESKTOP=1
  else 
    NEXT_DESKTOP=$(( $CURRENT_DESKTOP + 1 ))
  fi
elif [[ "$ARG" == "prev" ]]; then
  if [[ "$CURRENT_DESKTOP" == "1" ]]; then
    NEXT_DESKTOP=9
  else
    NEXT_DESKTOP=$(( $CURRENT_DESKTOP - 1 ))
  fi
elif [[ "$ARG" == "back" && -f $PREVIOUS_DESKTOP_FILE_PATH ]]; then
  PREVIOUS_DESKTOP=$(cat "$PREVIOUS_DESKTOP_FILE_PATH")
  if [[ -n $PREVIOUS_DESKTOP ]]; then
    qdbus-qt6 org.kde.KWin /KWin setCurrentDesktop $PREVIOUS_DESKTOP
  fi
fi

echo "$CURRENT_DESKTOP" > $PREVIOUS_DESKTOP_FILE_PATH
if [[ -z "$NEXT_DESKTOP" ]]; then
  exit
fi

qdbus-qt6 org.kde.KWin /KWin setCurrentDesktop $NEXT_DESKTOP
