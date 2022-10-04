# http://fishshell.com/docs/current/commands.html#fish_vi_mode
fish_vi_key_bindings

# http://fishshell.com/docs/current/cmds/abbr.html
if status --is-interactive
  abbr --add --global d git diff
  abbr --add --global g git
  abbr --add --global o xdg-open
  abbr --add --global r 'cd (git root)'
  abbr --add --global s git status
  abbr --add --global wt git_change_worktree
  abbr --add --global x exit
end

if test -f $HOME/.asdf/asdf.fish
  source $HOME/.asdf/asdf.fish
end

if type -q brew
  source (brew --prefix asdf)/libexec/asdf.fish
end

if type -q jenv
  jenv init - | source
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
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
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

if test (uname -s) = Darwin
  # 2022-08-09
  # `GPG_TTY` needs to be set in order to fix the error message “inappropriate
  # ioctl for device” I got when trying to sign a commit
  # https://stackoverflow.com/a/41054093
  export GPG_TTY=(tty)
end
