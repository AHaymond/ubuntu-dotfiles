# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export GREP_OPTIONS='--color=always'

alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

####################################
## functions
####################################
greps () {
  grep -iRan $1 $2 | less -R
}

work() {
  cd ~/masteryconnect
  loc=`pwd`
  name=${loc##*/}

  if ! tmux has-session -t "$name"; then
    tmux new-session -d -s "$name"
    tmux send-keys 'vim' C-m
    tmux split-window -v -c "$loc"
    tmux send-prefix t
  fi
  tmux attach -t "$name"
}

search_ruby () {
  open dash://ruby:$1
}

search_javascript () {
  open dash://javascript:$1
}

search_rails () {
  open dash://rails:$1
}

include() {
  [[ -f "$1" ]] && source "$1"
}

