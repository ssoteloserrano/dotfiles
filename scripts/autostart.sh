#!/usr/bin/env bash

source ~/.config/scripts/utils.sh

set_screen_layout() {
  if [[ $HOSTNAME == archlinux ]]; then
    xrandr --output HDMI-1 --left-of eDP-1 --auto &
  else
    xrandr --output DP-1 --primary --auto --rotate normal --output DP-3 --auto --rotate right &
  fi
}

start_auth_agent() {
  agent_process=$(pgrep -f "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  # check if the process already exists
  if ! [ -n "$agent_process" ]; then
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
  fi
}

start_compositor() {
  if ! pgrep -u $UID -x picom > /dev/null; then
    while pgrep -u $UID -x picom > /dev/null; do sleep 1; done
    picom -b &
  else
    print_status "Compositor" "running"
  fi
}

start_notification_daemon() {
  if ! pgrep -u $UID -x dunst > /dev/null; then
    dunst -config ~/.config/dunst/dunstrc &
  else
    print_status "Notification daemon" "running"
  fi
}

set_screen_layout
start_auth_agent
start_compositor
start_notification_daemon

feh ~/Pictures/Wallpapers/* --randomize --bg-fill & # random wallpaper
xset s off -dpms & # auto sleep mode
setxkbmap us altgr-intl & # keyboard layout
