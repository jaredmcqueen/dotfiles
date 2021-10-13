#!/bin/bash
VALUE="$1"
VOLUME_FILE=/tmp/currentVolume
MUTE_FILE=/tmp/currentMute
INTERVAL=10
MSG_ID=999
TIMEOUT=1000

if [ -f "$VOLUME_FILE" ]; then
   CURRENT_VOLUME=$(cat $VOLUME_FILE)
else
   CURRENT_VOLUME=50
fi

if [ -f "$MUTE_FILE" ]; then
   CURRENT_MUTE=$(cat $VOLUME_FILE)
else
   CURRENT_MUTE=true
fi

if [[ "$VALUE" = "up" ]]; then
  CURRENT_VOLUME=$(expr $CURRENT_VOLUME + $INTERVAL)
  if [[ $CURRENT_VOLUME -gt 100 ]]; then
    CURRENT_VOLUME=100
  fi
  for SINK in $(pacmd list-sinks | grep 'index:' | cut -b12-); do
    pactl set-sink-mute $SINK false
    pactl set-sink-volume $SINK ${CURRENT_VOLUME}%
  done
  canberra-gtk-play -i audio-volume-change 
  dunstify -a "changeVolume" -u low -i notification-audio-volume-high -t $TIMEOUT -r $MSG_ID \
    -h int:value:"$CURRENT_VOLUME" "Volume: ${CURRENT_VOLUME}%"

elif [[ "$VALUE" = "down" ]]; then
  CURRENT_VOLUME=$(expr $CURRENT_VOLUME - $INTERVAL)
  if [[ $CURRENT_VOLUME -lt 0 ]]; then
    CURRENT_VOLUME=0
  fi
  for SINK in $(pacmd list-sinks | grep 'index:' | cut -b12-); do
    pactl set-sink-mute $SINK false
    pactl set-sink-volume $SINK ${CURRENT_VOLUME}%
  done
  canberra-gtk-play -i audio-volume-change
  dunstify -a "changeVolume" -u low -i notification-audio-volume-high -t $TIMEOUT -r $MSG_ID \
    -h int:value:"$CURRENT_VOLUME" "Volume: ${CURRENT_VOLUME}%"

elif [[ "$VALUE" = "mute" ]]; then
  for SINK in $(pacmd list-sinks | grep 'index:' | cut -b12-); do
    pactl set-sink-mute $SINK true
  done
  dunstify -a "changeVolume" -u low -i notification-audio-volume-muted -t $TIMEOUT -r $MSG_ID "Volume muted" 
fi

echo $CURRENT_VOLUME > $VOLUME_FILE
echo $CURRENT_MUTE > $MUTE_FILE
