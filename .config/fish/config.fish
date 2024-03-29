# http://fishshell.com/docs/current/commands.html#fish_vi_mode
fish_vi_key_bindings

# http://fishshell.com/docs/current/cmds/abbr.html
if status --is-interactive
  abbr --add --global d git diff
  abbr --add --global g git
  abbr --add --global o xdg-open
  abbr --add --global r 'cd (git root)'
  abbr --add --global s git status
  abbr --add --global dt git difftool
  abbr --add --global wt git_change_worktree
  abbr --add --global x exit
end

# https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
if test -f $HOME/.asdf/asdf.fish
  source $HOME/.asdf/asdf.fish
end

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
# [installation]: https://github.com/jorgebucaran/fisher#bootstrap-installation
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  source $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fisher
end

# https://github.com/starship/starship
if type -q starship
  starship init fish | source
end

# https://github.com/ajeetdsouza/zoxide
if type -q zoxide
  zoxide init fish | source
end
