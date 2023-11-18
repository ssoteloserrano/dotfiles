if status is-interactive
    # Commands to run in interactive sessions can go here
  if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
  end
end

oh-my-posh init fish --config ~/.config/.poshthemes/zash.modified.json | source

source ~/.config/fish/env_vars.fish
