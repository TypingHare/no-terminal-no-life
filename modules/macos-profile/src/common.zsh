# Open a directory or reveal a file in Finder.app.
finder() {
  local target

  # Default to current directory if no argument
  target=${1:-.}

  if [[ -d $target ]]; then
    # Directory: open it in Finder
    open "$target"
  elif [[ -f $target ]]; then
    # File: reveal it in Finder
    open -R "$target"
  else
    printf "finder: no such file or directory: %s\n" "$target" >&2
    return 1
  fi
}

# Print the home directory contents excluding capitalized items.
home() {
  # Always go to $HOME
  builtin cd ~ || return 1

  if command -v lsd >/dev/null 2>&1; then
    # Exclude capitalized entries, like Desktop, Documents, etc.
    lsd -l -I '[A-Z]*'
  else
    # Fallback: regular ls (without filtering, since ls lacks -I)
    ls -l
  fi
}
