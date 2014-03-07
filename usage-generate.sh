## Generates github USAGE file from script comments.
## 
## Usage: ./usage-generate.sh > USAGE.markdown
## 
files=$(find . -maxdepth 1 -type f -perm /u+x|sort)
for file in $files
do
  egrep "^## " $file > /dev/null || continue
  echo $file
  echo ------------
  egrep "^## " $file | sed -e 's/^## //g'
  echo "
"
done
