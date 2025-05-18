# Apple Cloud directory path
export ICLOUD_PATH="$HOME/Library/Mobile Documents/com~apple~CloudDocs/"

# A help function to open Finder.app
function finder() {
  target="${1:-.}"

  if [ -d "$target" ]; then
    open "$target"
  elif [ -f "$target" ]; then
    open "$(dirname "$target")"
  else
    echo "'$target' is neither a directory nor a file"
    return 1
  fi
}

# Copy file path and directory path
function cpn() {
    if [ -z "$1" ]; then
        # No argument passed, copy current working directory
        echo "$(pwd)" | pbcopy
    else
        # Argument passed, combine current working directory with the file name
        echo "$(pwd)/$1" | pbcopy
    fi
}
