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
  sed -i -e '/Xft.dpi/ s/:.*/: 96/' $HOME/.Xresources
  sed -i -e '/rofi.dpi/ s/:.*/: 96/' $HOME/.Xresources
  xrdb -merge $HOME/.Xresources
fi

feh --bg-fill --randomize ~/Photos/wallpapers/*

alternating_layouts.py &
redshift -P -O 3000 &

killall -q picom
picom --inactive-dim=0.1 -b

# last thing is to change cursor
xsetroot -cursor_name left_ptr


i3-msg 'workspace 1; exec google-chrome-stable;' &
sleep 1
i3-msg 'workspace 2; exec alacritty;' &
sleep 1
i3-msg 'workspace 5; exec slack;' &
sleep 1
i3-msg 'workspace 5; exec signal-desktop;' &
sleep 1
i3-msg 'workspace 1' &
