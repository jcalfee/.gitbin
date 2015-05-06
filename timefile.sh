## Depends: sudo apt-get xprintidle watch -y
## 
## Record time entries under ~/.timefile/client1 every 10 minutes (unless idle).
## Usage: watch --interval=$((10 * 60)) ~/.gitbin/timefile.sh client1
##
## Record the start of a task
## Usage: ~/.gitbin/timefile.sh client1 "Updating About page"
## 
## Record a task that was started 10 minutes ago
## Usage: ~/.gitbin/timefile.sh client1 "Updating About page" 10

#set -o xtrace
set -o errexit
client=${1?which client?}
task=$2
task_past_minutes=${3-0}

time_dir=`date "+$HOME/.timefile/$client/%Y/%m"`
time_file=`date "+$HOME/.timefile/$client/%Y/%m/%Y-%m_Week%V.txt"`
mkdir -p "$time_dir"

#report
echo "$time_file"
tail -n 60 "$time_file"|sort -r

if [ ! -z "$task" ]
then
  echo -e "`date --iso-8601=seconds -d "$task_past_minutes min ago"`\tTASK\t$task" >> "$time_file"
  exit
fi

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
