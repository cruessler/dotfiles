# Installation

These dotfiles can be easily installed via `stow -t ~ .`. Stow can most likely
be installed through your favorite package manager, e. g. `sudo apt-get install
stow`.

# Assumptions

There are some assumptions about the environment these dotfiles are used in. In
particular, it is assumed that:

- fish is available at `/usr/bin/fish` (used as default shell in `.tmux.conf`)
- `~/.local/share/chruby/` contains chruby
- `~/bin/tmuxinator.bash` and `~/bin/tmuxinator.fish` are available
- `~/.texlive/2018/bin/x86_64-linux/` contains the binaries of a 2018 TeXLive
  installation
- `~/.elmenv/bin/` contains elmenv
- `~/.vim/bundle/` contains Vim plugins, particularly vim-pathogen at
  `~/.vim/bundle/vim-pathogen/`

These dotfiles don’t contain personal information and sensitive data; those are
supplied via includes wherever supported. In particular, the following files
are included:

- `~/.config/git/user` (included in `.gitconfig`)
- `~/.mutt/accounts` (included in `.muttrc`)
- `~/.config/newsbeuter/accounts` (included in `.config/newsbeuter/config`)