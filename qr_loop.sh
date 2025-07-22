#!/bin/bash

QR_TAP_X=220
QR_TAP_Y=1130

OUTPUT_FILE="links.txt"
TEMP_IMG="screen.png"
COUNT=10000
LAST_URL=""

for ((i=1; i<=COUNT; i++))
do
  echo "Processing QR #$i"

  adb shell input tap $QR_TAP_X $QR_TAP_Y
  sleep 1.75

  adb shell screencap -p /sdcard/$TEMP_IMG
  adb pull /sdcard/$TEMP_IMG > /dev/null

  url=$(python3 decode_qr.py "$TEMP_IMG")
  if [ "$url" != "NO_QR" ] && [ "$url" != "$LAST_URL" ]; then
    echo "$url" >> "$OUTPUT_FILE"
    echo "[INFO] QR $i: $url"
    LAST_URL="$url"
  elif [ "$url" == "$LAST_URL" ]; then
    echo "[WARN] QR $i: Duplicate detected, skipping"
  else
    echo "[ERROR] QR $i: Could not decode"
  fi

  adb shell input keyevent 4
  sleep 0.25
done

