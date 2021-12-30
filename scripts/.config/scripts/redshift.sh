#!/bin/bash
direction="$1"
log_file="$HOME/.redshift"
current="$(<"$log_file")"

if [ -z "$current" ]; then
  current=3000
fi

if [[ "$direction" = "down" ]]; then
  value=$(expr $current + 500)
  if [ $value -gt 5000 ]; then
    value=5000
  fi
  echo $value > $log_file
  redshift -PO $value
  
elif [[ "$direction" = "up" ]]; then
  value=$(expr $current - 500)
  if [ $value -lt 1000 ]; then
    value=1000
  fi
  echo $value > $log_file
  redshift -PO $value
fi
