#/usr/bin/env bash

## Command wrapper functions
## 
## Variables:
## cret = the return value of the last command (initialize: export cret)
## cerror = first error code of any command (initialize: export cerror=0)

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
  cret=$?
  [[ "$cerror" -eq 0 && $cret -ne 0 ]] && cerror=$cret
  return $cret
}

# USAGE: cnotify email@mymail.com "subject" echo Output from any command and parameters
function cnotify {
  EMAIL=${1?email}
  SUBJECT=${2?subject}
  shift 2
  cnotify_tmp=$(mktemp "/tmp/cnotify_tmp.XXXXXXX")
  "$@" > $cnotify_tmp
  cret=$?
  [[ "$cerror" -eq 0 && $cret -ne 0 ]] && cerror=$cret
  (
    echo "Subject: ($cret) $SUBJECT"
    echo 
    cat $cnotify_tmp
  )|/usr/sbin/sendmail $EMAIL
  rm $cnotify_tmp
  return $cret
}

