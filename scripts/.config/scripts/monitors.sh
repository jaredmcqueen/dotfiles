#!/bin/bash

if [ "$HOSTNAME" = "archlab" ]; then
  echo "this is the lab computer"
  sh ~/.config/scripts/monitors-dual.sh
  xrdb -merge /$HOME/.config/scripts/highdpi
fi

if [ "$HOSTNAME" = "archtop" ]; then
  echo "this is the laptop"
  xrdb -merge /$HOME/.config/scripts/lowdpi
fi
