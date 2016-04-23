client=${1?client}

fn=${client}_$(date --iso-8601=seconds).txt
echo $fn
test -f $fn &&
  echo File exists $fn &&
  exit 1

set -o errexit
mv $client.txt $fn
for r in report_*.sh; do echo ./$r; cat $fn|./$r; echo; done
