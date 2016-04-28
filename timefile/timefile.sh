## Depends: sudo apt-get xprintidle watch -y
##  
## Record time entries under ./client1 every 1 minute (unless idle).
##
## `watch ./timefile.sh client1`
## 
## Record the start of a task:
##
## `./timefile.sh client1 "Updating About page"`
##   
## Record a task that was started 10 minutes ago:
##
## `./timefile.sh client1 "About page design discussion" 10`
##  
## Get back on task:
##
## `./timefile.sh client1 "Updating About page"`
## 
## See folder: ./

#set -o xtrace
set -o errexit
client=${1-acme}
task=$2
task_past_minutes=${3-0}

time_dir="."
time_file="./${client}.txt"

mkdir -p "$time_dir"

if [ ! -z "$task" ]
then
  echo -e "`date --iso-8601=seconds -d "$task_past_minutes min ago"`\tTASK\t$task" >> "$time_file"
  exit
fi

#report
echo "$time_file"
test -e "$time_file" && tail -n 30 "$time_file"|sort

if test -f $time_dir/.touch_$client
then
  idle_minutes=$((`xprintidle` / 60 / 1000))
  current_epoch_minutes=$((`date +%s` / 60))
  last_touch_epoch_minutes=$((`stat --printf=+%Y $time_dir/.touch_$client` / 60))
  touch_elapsed_minutes=$((current_epoch_minutes - last_touch_epoch_minutes))
  test $idle_minutes -lt $touch_elapsed_minutes || exit
fi
touch $time_dir/.touch_$client
echo "`date --iso-8601=seconds`\tAUTO$touch_elapsed_minutes\t" >> "$time_file"
