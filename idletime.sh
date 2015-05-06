#set -o xtrace
if test -f ~/.idletime/.touch
then
  DISPLAY=:0.0 idle_minutes=$((`xprintidle` / 60 / 1000))
  current_epoch_minutes=$((`date +%s` / 60))
  last_touch_epoch_minutes=$((`stat --printf=+%Y .idletime/.touch` / 60))
  touch_elapsed_minutes=$((current_epoch_minutes - last_touch_epoch_minutes))
  test $idle_minutes -lt $touch_elapsed_minutes || exit
fi
touch ~/.idletime/.touch

year=`date "+%Y"`
month=`date "+%m"`
day=`date "+%d"`
mkdir -p ~/.idletime/$year/$month
#set +o xtrace
echo "`date --iso-8601=seconds`\tAUTO$touch_elapsed_minutes\t" >> ~/.idletime/$year/$month/`date +%Y-%d_Week%V`.txt
