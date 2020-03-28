# This file contains settings and commands that are to be applied once during
# startup.
#
# https://superuser.com/a/183980

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

PATH="$HOME/.texlive/2019/bin/x86_64-linux:$PATH"
PATH="$HOME/.npm/bin:$PATH"

# used by Python’s pip and Haskell’s stack
PATH="$HOME/.local/bin:$PATH"

# used by Rust’s cargo
PATH="$HOME/.cargo/bin:$PATH"

export GOPATH="$HOME/.go"
PATH="$GOPATH/bin:$PATH"

# https://github.com/sonnym/elmenv
PATH="$HOME/.elmenv/bin:$PATH"

export PATH

export EDITOR=vi
export BROWSER=firefox
