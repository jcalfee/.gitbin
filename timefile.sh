## Depends: sudo apt-get xprintidle watch -y
##  
## Record time entries under ~/.timefile/client1 every 10 minutes (unless idle).
## `watch ~/.gitbin/timefile.sh client1`
## 
## Record the start of a task:
## `~/.gitbin/timefile.sh client1 "Updating About page"`
##   
## Record a task that was started 10 minutes ago:
## `~/.gitbin/timefile.sh client1 "About page design discussion" 10`
##  
## Get back on task:
## `~/.gitbin/timefile.sh client1 "Updating About page"`
## 
## See: ~/.timefile

#set -o xtrace
set -o errexit
client=${1?which client?}
task=$2
task_past_minutes=${3-0}

time_dir="$HOME/.timefile"
time_file="$HOME/.timefile/${client}.txt"

mkdir -p "$time_dir"

if [ ! -z "$task" ]
then
  echo -e "`date --iso-8601=seconds -d "$task_past_minutes min ago"`\tTASK\t$task" >> "$time_file"
  exit
fi

#report
echo "$time_file"
test -e "$time_file" && tail -n 30 "$time_file"|sort

if test -f ~/.timefile/.touch_$client
then
  DISPLAY=:0.0 idle_minutes=$((`xprintidle` / 60 / 1000))
  current_epoch_minutes=$((`date +%s` / 60))
  last_touch_epoch_minutes=$((`stat --printf=+%Y $HOME/.timefile/.touch_$client` / 60))
  touch_elapsed_minutes=$((current_epoch_minutes - last_touch_epoch_minutes))
  test $idle_minutes -lt $touch_elapsed_minutes || exit
fi
touch ~/.timefile/.touch_$client
echo "`date --iso-8601=seconds`\tAUTO$touch_elapsed_minutes\t" >> "$time_file"
