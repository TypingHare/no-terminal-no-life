# Open the Finder.app.
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

# Print the home directory contents excluding capitalized items.
alias home="cd ~ && lsd -l -I '[A-Z]*'"
