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

# Copy file path (absolute path)
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

# Move file from path in clipboard to current directory
function put() {
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

# Open ~/Downloads
alias downloads="pushd ~/Downloads && ll"

# Neovide
alias neo="neovide --grid=128x40"
