# Installation

These dotfiles can be easily installed via `stow -t ~ .`. Stow can most likely
be installed through your favorite package manager, e. g. `sudo apt-get install
stow`.

# Assumptions

There are some assumptions about the environment these dotfiles are used in. In
particular, it is assumed that:

- fish is available at `/usr/bin/fish` (used as default shell in `.tmux.conf`)
- `~/bin/tmuxinator.bash` and `~/bin/tmuxinator.fish` are available
- `~/.texlive/2020/bin/x86_64-linux/` contains the binaries of a 2020 TeXLive
  installation
- `~/.vim/bundle/` contains Vim plugins, particularly vim-pathogen at
  `~/.vim/bundle/vim-pathogen/`
- `~/.tmux/plugins/` contains tmux plugins
- `~/.asdf/` contains asdf

These dotfiles don’t contain personal information and sensitive data; those are
supplied via includes wherever supported. In particular, the following files
are included:

- `~/.config/git/user` (included in `.gitconfig`)
- `~/.mutt/accounts` (included in `.muttrc`)
- `~/.config/newsbeuter/accounts` (included in `.config/newsbeuter/config`)

## Installed programs

These dotfiles use the following programs, e. g. by loading config files or
setting up aliases, but they check for their presence before doing that.

`exa` and `bat` can be used as drop-in replacements for `ls` and `cat`,
respectively. If they are installed, `ls` and `cat` are set up as an alias to
`exa` and `bat`, [as descibed here][alias].

[alias]: https://towardsdatascience.com/rust-powered-command-line-utilities-to-increase-your-productivity-eea03a4cf83a#69a8

- `bat`
- `broot`
- `exa`
- `starship`
- `zoxide`
