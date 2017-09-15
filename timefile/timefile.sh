## Depends: sudo apt-get xprintidle watch -y
##  
## Record time entries under task1 every 1 minute (unless idle).
##
## `watch ./timefile.sh task1`
## 
## Record the start of a task:
##
## `./timefile.sh TaskB
##   
## Get back on task:
##
## `./timefile.sh TaskA
## 
## See folder: ./

#set -o xtrace
set -o errexit
task=${1-widget}

time_dir="."
time_file="./${task}"

mkdir -p "$time_dir"

#report
echo "$time_file"
test -e "$time_file" && tail -n 30 "$time_file"|sort

if test -f $time_dir/.touch_$task
then
  idle_minutes=$((`xprintidle` / 60 / 1000))
  current_epoch_minutes=$((`date +%s` / 60))
  last_touch_epoch_minutes=$((`stat --printf=+%Y $time_dir/.touch_$task` / 60))
  touch_elapsed_minutes=$((current_epoch_minutes - last_touch_epoch_minutes))
  test $idle_minutes -lt $touch_elapsed_minutes || exit
fi
touch $time_dir/.touch_$task
echo "`date --iso-8601=seconds`\tAUTO$touch_elapsed_minutes\t" >> "$time_file"
