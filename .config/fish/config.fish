# http://fishshell.com/docs/current/commands.html#fish_vi_mode
fish_vi_key_bindings

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
