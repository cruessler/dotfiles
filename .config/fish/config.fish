# http://fishshell.com/docs/current/commands.html#fish_vi_mode
fish_vi_key_bindings

# https://github.com/JeanMertz/chruby-fish
set -x CHRUBY_ROOT $HOME/.local
source $CHRUBY_ROOT/share/chruby/chruby.fish

# https://github.com/postmodern/chruby/#rubies-1
set -x RUBIES $HOME/.ruby/* $RUBIES
status --is-interactive; and source $CHRUBY_ROOT/share/chruby/auto.fish

# elmenv relies on undocumented behaviour that was removed in fish 2.6.0
# https://github.com/fish-shell/fish-shell/issues/4103
#
# a workaround is to provide an implementation of setenv that behaves like
# elmenv expects it to behave
# https://github.com/fish-shell/fish-shell/issues/4103#issuecomment-306677759
function setenv
    set -gx $argv
end
# https://github.com/sonnym/elmenv
status --is-interactive; and . (elmenv init -|psub)

source $HOME/.asdf/asdf.fish

# https://github.com/Canop/broot
# run `broot --install` to install the launcher
if test -f $HOME/.config/broot/launcher/fish/br
  source $HOME/.config/broot/launcher/fish/br
end

# this automatically installs fisher which is why both [fisher] and
# [completions] are ignored by git
#
# [fisher]: .config/fish/functions/fisher.fish
# [completions]: .config/fish/completions/fisher.fish
# https://github.com/jorgebucaran/fisher#bootstrap-installation
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
