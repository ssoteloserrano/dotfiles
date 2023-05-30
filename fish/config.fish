if status is-interactive
    # Commands to run in interactive sessions can go here
end

# oh-my-posh init fish --config ~/half-life.omp.json | source
oh-my-posh init fish --config ~/zash.omp.json | source



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/scarlett/google-cloud-sdk/path.fish.inc' ]; . '/home/scarlett/google-cloud-sdk/path.fish.inc'; end

set -x PATH $PATH '/home/scarlett/.local/bin'
