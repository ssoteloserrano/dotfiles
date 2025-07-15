#!/usr/bin/env bash

## Author     : Scarlett Sotelo | @scarktt

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi"

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend="⏾ Sleep"
logout=" Logout"

# Variable passed to rofi
options="$suspend\n$logout\n$lock\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -m 0 -p "Uptime: $uptime" -dmenu -theme $HOME/.config/rofi/powermenu.rasi)"
case $chosen in
$shutdown)
  systemctl poweroff
  ;;
$reboot)
  systemctl reboot
  ;;
$lock)
  # To update image to use first run: betterlockscreen -u ~/path/to/some_picture
  betterlockscreen -l
  ;;
$suspend)
  mpc -q pause
  amixer set Master mute
  systemctl suspend
  ;;
$logout)
  bspc quit
  ;;
esac
