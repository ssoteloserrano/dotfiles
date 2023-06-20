#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

pacman_updates=$(checkupdates | wc -l)
aur_updates=$(yay -Qua | wc -l)
flatpak_updates=$(flatpak update -p | wc -l)
total_updates=$((pacman_updates + aur_updates + flatpak_updates))

export TOTAL_PKGS="%{T5} %{T-}$total_updates"
export PACMAN_PKGS="󰮯 $pacman_updates"
export AUR_PKGS="󰣇 $aur_updates"
export FLATPAK_PKGS="󰏗 $flatpak_updates"

# Launch main bar
echo "---" | tee -a /tmp/polybar.log

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi

echo "Bars launched..."
