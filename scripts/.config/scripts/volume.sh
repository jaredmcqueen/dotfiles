#!/bin/bash
VALUE="$1"
FILE=/tmp/currentVolume
INTERVAL=10

if [ -f "$FILE" ]; then
   CURRENT_VOLUME=$(cat $FILE)
else
   CURRENT_VOLUME=50
fi

if [[ "$VALUE" = "up" ]]; then
  CURRENT_VOLUME=$(expr $CURRENT_VOLUME + $INTERVAL)
  if [[ $CURRENT_VOLUME -gt 100 ]]; then
    CURRENT_VOLUME=100
  fi
  for SINK in $(pacmd list-sinks | grep 'index:' | cut -b12-); do
    pactl set-sink-volume $SINK ${CURRENT_VOLUME}%
    pactl set-sink-mute $SINK false
  done
elif [[ "$VALUE" = "down" ]]; then
  CURRENT_VOLUME=$(expr $CURRENT_VOLUME - $INTERVAL)
  if [[ $CURRENT_VOLUME -lt 0 ]]; then
    CURRENT_VOLUME=0
  fi
  for SINK in $(pacmd list-sinks | grep 'index:' | cut -b12-); do
    pactl set-sink-volume $SINK ${CURRENT_VOLUME}%
    pactl set-sink-mute $SINK false
  done
elif [[ "$VALUE" = "mute" ]]; then
  for SINK in $(pacmd list-sinks | grep 'index:' | cut -b12-); do
    pactl set-sink-mute $SINK toggle
  done
fi

echo $CURRENT_VOLUME > $FILE
