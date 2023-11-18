#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

export WM="module/${GDMSESSION}"

arg1=$1

start_updates_counter() {

  pacman_updates=$(checkupdates | wc -l)
  aur_updates=$(yay -Qua | wc -l)
  flatpak_updates=$(flatpak update | wc -l)
  total_updates=$((pacman_updates + aur_updates + flatpak_updates))

  export TOTAL_PKGS="%{T3}  %{T-}$total_updates"
  export PACMAN_PKGS="󰮯 $pacman_updates"
  export AUR_PKGS="󰣇 $aur_updates"
  export FLATPAK_PKGS="󰏗 $flatpak_updates"
}

get_bar() {
  local received_argument="$1"
  if [ -z "$received_argument" ]; then
      echo "default"
  else
      echo "$received_argument"
  fi
}

start_bar() {
  # local current_bar=floating-minimalistic
  local current_bar="$1"

  if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      MONITOR=$m polybar --reload $current_bar &
    done
  else
    polybar --reload $current_bar &
  fi
  echo "Bar launched..."
}

# start_updates_counter &
arg1="$1"
bar=$(get_bar "$arg1")
start_bar "$bar"

