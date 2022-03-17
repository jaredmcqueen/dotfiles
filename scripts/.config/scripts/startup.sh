#!/bin/bash
if [ "$HOSTNAME" = "archlab" ]; then
  echo "this is the 4k lab computer"
  xrandr \
  --output DP-1 \
  --primary \
  --mode 3840x2160 \
  --pos 3840x0 \
  --output HDMI-1 \
  --mode 3840x2160 \
  --pos 0x0
  sed -i -e '/Xcursor.size/ s/:.*/: 72/' $HOME/.Xresources
  sed -i -e '/Xft.dpi/ s/:.*/: 144/' $HOME/.Xresources
  sed -i -e '/rofi.dpi/ s/:.*/: 144/' $HOME/.Xresources
  xrdb -merge $HOME/.Xresources
  pactl set-card-profile 0 output:hdmi-stereo-extra1
fi

if [ "$HOSTNAME" = "archtop" ]; then
  echo "this is the laptop"
  sed -i -e '/Xcursor.size/ s/:.*/: 72/' $HOME/.Xresources
  sed -i -e '/Xft.dpi/ s/:.*/: 120/' $HOME/.Xresources
  sed -i -e '/rofi.dpi/ s/:.*/: 120/' $HOME/.Xresources
  xrdb -merge $HOME/.Xresources
fi

feh --bg-fill --randomize ~/Photos/wallpapers/*
redshift -P -O 3000 &

# alternating_layouts.py
killall -q python3
while pgrep -u $UID -x python3 >/dev/null; do sleep 1; done
alternating_layouts.py &

# picom
killall -q picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom -b

# dunst
killall -q dunst
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done
dunst &

#polybar
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Manage multiple monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
    if [ "$m" = "HDMI-1" ]; then
        echo "skipping HDMI monitor"
        continue
    fi
    echo "adding polybar to $m"
    MONITOR=$m polybar --reload top &
done

killall -q xfce
xfce4-power-manager --daemon

i3-msg 'exec slack;' &
i3-msg 'exec signal-desktop;' &
i3-msg 'workspace 1' &
