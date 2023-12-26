# This file contains settings and commands that are to be applied once during
# startup.
#
# https://superuser.com/a/183980

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

PATH="$HOME/.texlive/2020/bin/x86_64-linux:$PATH"
PATH="$HOME/.npm/bin:$PATH"

# used by Python’s pip and Haskell’s stack
PATH="$HOME/.local/bin:$PATH"

# let cargo, if present, change $PATH
if [ -f "$HOME/.cargo/env" ] ; then
  source "$HOME/.cargo/env"
fi

# let ghcup, if present, change $PATH
if [ -f "$HOME/.ghcup/env" ] ; then
  source "$HOME/.ghcup/env"
fi

export GOPATH="$HOME/.go"
PATH="$GOPATH/bin:$PATH"

export PATH

export CDPATH=".:$HOME/repos"

export EDITOR=nvim
export BROWSER=firefox
