print_status() {
  local text=$1
  local state=$2

  local green="\e[32m"
  local red="\e[31m"
  local reset="\e[0m"
  local state_color=""

  local circle="\u25cf"

  if [[ $state == *"running"* ]]; then
    state_color=${green}
  else
    state_color=${red}
  fi

  echo -e "${state_color}${circle}${reset} ${text}"
  echo -e "    State: ${state_color}${state}${reset}"
}
