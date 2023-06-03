#!/usr/bin/env bash

# monitors
xrandr --output DP-1 --primary --auto --rotate normal --output DP-3 --auto --rotate right &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# notification daemon
dunst -config ~/.config/dunst/dunstrc &

# compositor
while pgrep -u $UID -x picom > /dev/null; do sleep 1; done
picom -b &

# status bar
~/.config/polybar/launch.sh &

feh --bg-fill /home/$USER/Pictures/Wallpapers/Wallpaper-Steven-Universe-HD.jpg &

# auto sleep mode
xset s off -dpms &

# keyboard layout
setxkbmap us altgr-intl &
