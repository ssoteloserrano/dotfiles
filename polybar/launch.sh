#!/usr/bin/env bash

killall -q polybar

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

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

# Launch the bar
launch_bar() {
  # Terminate already running bar instances
  killall -q polybar

  local current_bar="$1"

  # Wait until the processes have been shut down
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

  if type "xrandr"; then
    for mon in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$mon polybar -q $current_bar -c "$DIR"/config.ini &
    done
    notify-send "Polybar" "Configuration started" -i "/usr/share/icons/Papirus-Dark/16x16/apps/preferences-desktop-keyboard-shortcuts.svg"
  else
    notify-send "Polybar" "Configuration reloaded" -i "/usr/share/icons/Papirus-Dark/16x16/apps/preferences-desktop-keyboard-shortcuts.svg"
    polybar --reload $current_bar &
  fi
}

# start_updates_counter &
arg1="$1"
bar_name=$(get_bar "$arg1")
# start_bar "$bar_name"

launch_bar "$bar_name"
