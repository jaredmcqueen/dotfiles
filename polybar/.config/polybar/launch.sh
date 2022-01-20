#!/bin/env bash

# Terminate already running bars
killall -q polybar

# Wait until bars have been terminated
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

export WIRELESSINTERFACE = $(ip -o link show | grep wl | awk -F': ' '{print $2}')

# Manage multiple monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
    if [ "$m" = "HDMI-1" ]; then
        echo "skipping HDMI monitor"
        continue
    fi
    echo "adding polybar to $m"
    MONITOR=$m polybar --reload top &
done

