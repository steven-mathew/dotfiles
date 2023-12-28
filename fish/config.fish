if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

zoxide init fish --cmd j | source
# starship init fish | source

# if set -q KITTY_INSTALLATION_DIR
#     set --global KITTY_SHELL_INTEGRATION enabled
#     source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
#     set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
# end

alias ll='exa --icons'

set -gx EDITOR nvim
set -g fish_key_bindings fish_hybrid_key_bindings

set -gx NNN_TRASH 1

set PATH opt/homebrew/bin $PATH
set PATH $PATH ~/.cargo/bin


# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/steven/dev/csc301/examples/starter/articulate/terraform/google-cloud-sdk/path.fish.inc' ]; . '/Users/steven/dev/csc301/examples/starter/articulate/terraform/google-cloud-sdk/path.fish.inc'; end

# opam configuration
source /Users/steven/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
