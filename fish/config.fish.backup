if status is-interactive
    # Commands to run in interactive sessions can go here
  if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
  end
end

oh-my-posh init fish --config ~/.config/.poshthemes/zash.modified.json | source

set -x PATH $PATH '/home/scarlett/.local/bin'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/scar/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/home/scar/Downloads/google-cloud-sdk/path.fish.inc'; end

# set -x PATH $PATH $GOPATH/bin
set -Ua fish_user_paths '/home/scar/go/bin'
