#!/bin/bash

ADD_TO_GAME_X=550
ADD_TO_GAME_Y=2150

WAIT_TIME=3
COUNT=$(wc -l < links.txt)

for ((i=1; i<=COUNT; i++))
do
  url=$(sed -n "${i}p" links.txt)
  echo "Opening link #$i: $url"

  adb shell am start -a android.intent.action.VIEW -d "$url"
  sleep $WAIT_TIME

  adb shell input tap $ADD_TO_GAME_X $ADD_TO_GAME_Y
  sleep 1.5
done

