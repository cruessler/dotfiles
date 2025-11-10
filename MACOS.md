## Bootstrapping on a new Mac

These are the steps needed to get my dev environment running on a new Mac. They
include setting up the NeoQwertz keyboard layout, installing my dotfiles and
linking them by using `stow` as well as installing a couple of developer tools,
among other things.

- Install Firefox
- Install NeoQwertz
- Install Karabiner Elements
  Go to “Settings / Devices / <Device>” and check “Modify events” for each
  keyboard you want to use with NeoQwertz
  In “System Settings / Function keys”, check “Use … as standard function keys”
  In the Karabiner settings, in “Simple modifications”, map `right_command` to
  `left_command`, otherwise many keyboard shortcuts such as `<right cmd-a>`
  will not work (if there’s any downsides to that, I don’t know of them yet)
- Install theme for `Terminal.app`: https://monokai.pro/terminal
- Install “Fira Code Nerd Font”: https://www.nerdfonts.com/font-downloads

- Install `brew` (by default, it installs binaries to `/opt/homebrew/bin/`)
- Configure `user.name` and `user.email` for git
- Create a token for use with `gh auth login`
- Install `pass`: `/opt/homebrew/bin/brew install pass`
- `make bootstrap_mac` (among other things, this creates `$HOME/bin`)
- Install `stow`: `/opt/homebrew/bin/brew install stow`
- Install `dotfiles`: `gh repo clone cruessler/dotfiles`, `make stow`
- Install `asdf`: `/opt/homebrew/bin/brew install brew`
- Install Ruby and Node
  Installing Ruby through `ruby-build` requires `libyaml`:
  `/opt/homebrew/bin/brew install libyaml`
  https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
- Install programs mentioned under “Assumptions”
- Add more virtual desktops through “Mission Control”, available via `fn + F3`
- Configure shortcuts for desktop navigation: `<cmd-s>`, `<cmd-f>` (they
  conflict with built-in shortcuts that are often used, so I probably want to
  start looking for different ones)
