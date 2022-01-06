#!/bin/bash
if [ "$HOSTNAME" = "archlab" ]; then
  echo "this is the 4k lab computer"
  xrandr --output DP-1 --primary --mode 3840x2160 --pos 3840x0 --rotate normal --output HDMI-1 --mode 3840x2160 --pos 0x0 --rotate normal --output DP-2 --off --output DP-3 --off
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

alternating_layouts.py &
redshift -P -O 3000 &

killall -q picom
picom -b

killall -q dunst
dunst &

i3-msg 'exec slack;' &
i3-msg 'exec signal-desktop;' &
i3-msg 'workspace 1' &
