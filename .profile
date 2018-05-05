# This file contains settings and commands that are to be applied once during
# startup.
#
# https://superuser.com/a/183980

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

PATH="$PATH:$HOME/.texlive/2018/bin/x86_64-linux"
PATH="$PATH:$HOME/.npm/bin"

# used by Python’s pip and Haskell’s stack
PATH="$PATH:$HOME/.local/bin"

# used by Rust’s cargo
PATH="$PATH:$HOME/.cargo/bin"

export GOPATH=$HOME/.go
PATH="$PATH:$GOPATH/bin"

# https://github.com/sonnym/elmenv
PATH="$PATH:$HOME/.elmenv/bin"

export PATH

export EDITOR=vi
export BROWSER=firefox
