# This file contains settings and commands that are to be applied once during
# startup.
#
# https://superuser.com/a/183980

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

export PATH

export EDITOR=vi
export BROWSER=firefox
