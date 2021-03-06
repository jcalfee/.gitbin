## Generates github USAGE file from script comments.
## 
## Usage: ./usage-generate.sh > USAGE.md
## 
files=$(find . -maxdepth 1 -type f -perm /u+x|sort)
for file in $files
do
  egrep "^## " $file > /dev/null || continue
  echo "[$file]($file)"
  echo ------------
  egrep "^##" $file | sed -re "s/^## ?//g"
  echo "
"
done
