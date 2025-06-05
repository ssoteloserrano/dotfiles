#!/bin/sh
# Script invocado usando atajos de teclado para crear una nueva sesión en tmux
# para una carpeta seleccionada con fzf, o bien, para la ruta recibida como
# parámetro.

# Primero que todo, definir la lista de carpetas con las cuales realizar la
# búsqueda con fzf, y luego rescatar el nombre de la ruta seleccionada.
# Normalmente usar Alt+C en la consola con fzf instalado lista todas las
# carpetas bajo la ruta actual, pero hacer esto desde home toma varios segundos
# para llenar la lista. En su lugar, simplemente se listan las carpetas de uso
# más común, las cuales luego se pasan a fzf para permitir su selección rápida.

if [ $# -eq 1 ]; then
    selected_path=$1
else
    folders="/home/scar/\n"
    folders+=$(find ~/Notes -mindepth 0 -maxdepth 3 -type d)"\n"
    folders+=$(find ~/Documents -mindepth 0 -maxdepth 2 -type d)"\n"
    folders+=$(find ~/Downloads -mindepth 0 -maxdepth 2 -type d)"\n"
    folders+=$(find ~/.config -mindepth 0 -maxdepth 2 -type d)"\n"
    folders+=$(find $WORK -mindepth 0 -maxdepth 3 -type d)"\n"
    folders+=$(find ~/dev/personal -mindepth 0 -maxdepth 3 -type d)"\n"
    selected_path=`printf "$folders" | fzf`
fi

if [ -z $selected_path ]; then
    exit 0
fi

# Definir el nombre de la sesión usando el nombre de la carpeta seleccionada
# más el nombre de su carpeta superior. Si la carpeta superior es home, es
# decir, el nombre del usuario, entonces sólo usar el nombre de la carpeta
# seleccionada, ya que incluir el nombre de usuario está de más.

parent_dir=$(basename $(dirname "$selected_path"))
selected_dir=$(basename "$selected_path")

if [ $parent_dir != $USER ]; then
    parent_dir=$(echo "$parent_dir" | sed 's/^\.*//')
    session_name=$(echo "$parent_dir|$selected_dir")
    echo $session_name
else
    session_name=$selected_dir
fi

# Si la sesión con dicho nombre no existe, crear una nueva sesión en tmux con
# cuatro ventanas, abrir nvim en la primera, y cambiar a dicha sesión. Si la
# sesión ya existe, entonces simplemente cambiar a dicha sesión sin crear nada.

if ! tmux has-session -t="$session_name" 2> /dev/null; then
    tmux new-session -ds "$session_name" -c $selected_path
    tmux new-window -t "$session_name" -c $selected_path
    tmux new-window -t "$session_name" -c $selected_path
    tmux send-keys -t "$session_name":1 'nvim' Enter
    tmux switch-client -t "$session_name":1
else
    tmux switch-client -t "$session_name"
fi
