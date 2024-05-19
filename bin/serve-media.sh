#!/usr/bin/env bash

echo "" > p.m3u

for path in $(find -type f | shuf)
do
  av=$(file --mime-type "$path" | grep -E '(audio|video)')
  if [ "$av" != "" ]; then
    echo "$path" >> p.m3u
  fi
done

http-server .

