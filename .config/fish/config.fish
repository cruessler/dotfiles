# http://fishshell.com/docs/current/commands.html#fish_vi_mode
fish_vi_key_bindings

# https://github.com/JeanMertz/chruby-fish
set -x CHRUBY_ROOT $HOME/.local
source $CHRUBY_ROOT/share/chruby/chruby.fish

# https://github.com/postmodern/chruby/#rubies-1
set -x RUBIES $HOME/.ruby/* $RUBIES
status --is-interactive; and source $CHRUBY_ROOT/share/chruby/auto.fish
