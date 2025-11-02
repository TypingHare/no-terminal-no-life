# Collect all files in a directory and output it to `all.txt`
function collect_files() {
  find "$1" -type f -name '*' -print0 | while IFS= read -r -d '' file; do
    echo -e "\n==> $file" >>all.txt
    if file --mime "$file" | grep -q 'charset=binary'; then
      echo "<binary file>" >>all.txt
    else
      cat "$file" >>all.txt
    fi
    echo "" >>all.txt
  done
}
