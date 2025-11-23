# Copy the absolute path to a file to the clipboard.
function pick() {
  if [ -z "$1" ]; then
    # No argument passed, copy current working directory
    echo "$(pwd)" | pbcopy
  else
    # Argument passed, combine current working directory with the file name
    echo "$(pwd)/$1" | pbcopy
  fi
}
compdef _files pick

# Move file from path in clipboard to current directory.
function drop() {
  src_path="$(pbpaste)"
  dest_dir="."
  operation="mv"

  if [[ "$1" == "--copy" ]]; then
    operation="cp"
  fi

  if [ -e "$src_path" ]; then
    $operation "$src_path" "$dest_dir"
    echo "$([[ $operation == cp ]] && echo Copied || echo Moved): $src_path -> $(pwd)"
  else
    echo "No such file or directory: $src_path"
  fi
}
