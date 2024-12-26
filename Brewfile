brew "stow"

brew "fish"
brew "tmux"
# required by tmux-plugin/tmux-urlview
brew "urlview"

tap "homebrew/cask-fonts"

cask_args appdir: "~/Applications"

cask "alacritty", args: { no_quarantine: true }
cask "firefox"
cask "font-fira-code-nerd-font"

brew "asdf"

brew "gh"
# 2022-08-12
# switched to `--HEAD` because `plugins.lua` contains configuration that only
# works with neovim >= 0.8, and the current stable version installed by brew is
# 0.7.2
# the development version of neovim can be installed with `brew install --HEAD
# neovim`
# `brew bundle` does not seem to automatically update neovim if it is already
# installed without `--HEAD`
# https://github.com/neovim/neovim/wiki/Installing-Neovim#homebrew-on-macos-or-linux
brew "neovim", args: ["HEAD"]
brew "pass"
brew "tig"

brew "bat"
brew "broot"
brew "eza"
brew "fd"
brew "git-delta"
brew "ripgrep"
brew "starship"
brew "stylua"
brew "zoxide"

brew "exercism"
