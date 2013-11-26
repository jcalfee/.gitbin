#/usr/bin/env bash

## Command wrapper functions.  Prefix a command with one 
## or more of these functions to aid in logging.

function ctime {
  date
  "$@"
  cret=$?
  [[ "$cerror" -eq 0 && $cret -ne 0 ]] && cerror=$cret
  date
  return $cret
}

function ctrace {
  echo "+ $@"
  "$@"
  cret=$?
  [[ "$cerror" -eq 0 && $cret -ne 0 ]] && cerror=$cret
  echo "EXIT $cret"
  return $cret
}

function crun {
  ctime ctrace "$@"
}

function clog {
  LOG="${1?log file}"
  shift 1
  # >(Process substitution) must be used in place of pipe so $cmd will run
  # in this shell giving access to the return code $?.
  "$@" > >(tee -a "$LOG") 2>&1
}

# firebird specific
#function ctrim {
#  ctrim_tmp=$(mktemp /tmp/ctrim_tmp.XXXXXX)
#  "$@" > $ctrim_tmp 2>&1
#  cret=$?
#  [[ "$cerror" -eq 0 && $cret -ne 0 ]] && cerror=$cret
#  if test $cret -eq 0
#  then
#    # success, remove (-v) all gbak output (^ anchors to start of line)
#    # remove tape's file names (line starts with /)
#    # remove tape's Verify lines
#    egrep -v "^gbak:|^Verify |^/" $ctrim_tmp>$ctrim_tmp.2
#    mv $ctrim_tmp.2 $ctrim_tmp
#  fi
#  cat $ctrim_tmp
#  rm $ctrim_tmp
#  return $cret
#}


# re-work to use `mail`
#function cnotify {
#  EMAIL=${1?email}
#  SUBJECT=${2?subject}
#  shift 2
#  cnotify_tmp=$(mktemp "/tmp/cnotify_tmp.XXXXXXX")
#  "$@" > $cnotify_tmp 2>&1
#  cret=$?
#  [[ "$cerror" -eq 0 && $cret -ne 0 ]] && cerror=$cret
#  mail_file.exp $EMAIL "($cret) $SUBJECT" $cnotify_tmp #> /dev/null
#  rm $cnotify_tmp
#  return $cret
#}


