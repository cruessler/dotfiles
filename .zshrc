# 2022-09-28
# load `.profile` (it’s not loaded by default)
# this enables sharing config between bash and zsh without the need for
# `.profile` to be changed
# I don’t know whether this is the most idiomatic way to achieve this goal
# the following link contains information on how zsh loads its config files
# https://wiki.archlinux.org/title/Zsh#Startup/Shutdown_files
emulate sh -c "source $HOME/.profile"

export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

if [ -x $HOME/homebrew/bin/brew ] ; then
  eval "$($HOME/homebrew/bin/brew shellenv)"
fi
