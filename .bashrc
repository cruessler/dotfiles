# This .bashrc contains two sections.
#
# The first section contains commands that are run for every bash invocation,
# interactive and non-interactive. Its purpose is to set up environment
# variables specifically for bash (otherwise they would go into .profile which
# only contains settings that are inherited by all shells).
#
# The second section contains commands that will only be run for interactive
# bash shells. It is mostly about command completion and customizations of the
# prompt (other shells have their own config files for this purpose).
#
# For detailed explanations, see
# http://meta.ath0.com/2007/10/23/cleaning-up-bash-customizations/
#
# For Ubuntu’s default .bashrc, see
# /etc/skel/.bashrc

# Commands above this comment are run for every bash invocation, interactive
# and non-interactive.

# If not running interactively, exit.
case $- in
  *i*) ;;
    *) return;;
esac

# Commands below this comment are only run for interactive bash shells.

# The following customizations are taken from Ubuntu’s default .bashrc.
HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f ~/bin/tmuxinator.bash ] && source ~/bin/tmuxinator.bash

PS1='\w $ '

# https://github.com/Canop/broot
# run `broot --install` to install the launcher
[ -f ~/.config/broot/launcher/bash/br ] && source ~/.config/broot/launcher/bash/br

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
