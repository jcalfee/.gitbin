#task=${1-widget}

set -o errexit

for task in "$@"
do
  for r in report_*.sh
  do
    echo $(basename ./$r) $task
    cat $task|./$r
    echo
  done
done

mkdir -p invoiced
echo Copy and paste the following mv commands:
for task in "$@"
do
  fn=invoiced/${task}_$(date --iso-8601=seconds).txt
  echo mv $task $fn
done
