if [ -f /etc/profile ]; then
  PATH=""
  source /etc/profile
fi
#export PATH=/usr/local/bin:$PATH

export GREP_OPTIONS='--color=always'

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

# OPATH=$PATH

# if [ -z "$BASH" ]
#   then typeset -A FOO # ksh93
#   else declare -A FOO # bash
# fi
# OIFS=$IFS
# IFS=':'
# for A in ${PATH}
# do
#   [ -z "${FOO[${A}]}" ] || continue

#   # By this point no dupe was found
#   FOO[${A}]=${#FOO[*]}

#   # Reconstruct the $PATH
#   if [ -z "$RET_VAL" ]
#     then RET_VAL="$A"
#     else RET_VAL="${RET_VAL}:${A}"
#   fi
# done
# IFS=$OIFS
# echo $RET_VAL
