# Apple cloud
alias cloud="cd $HOME/Library/Mobile Documents/com~apple~CloudDocs/"

# A help function
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
