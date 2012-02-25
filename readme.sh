## Usage: ./readme.sh > README.markdown
files=$(find . -maxdepth 1 -type f -perm /u+x)
for file in $files
do
  egrep "^## " $file > /dev/null || continue
  echo $file
  echo ------------
  egrep "^## " $file | sed -e 's/^## //g'
  echo "
"
done
