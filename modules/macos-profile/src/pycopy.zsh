# Copy the absolute path of a file/directory to the clipboard.
pick() {
  local target

  if [[ $# -eq 0 ]]; then
    # No argument: use current directory
    target=$PWD
  else
    # Argument passed: use it as a path (absolute, relative, or ~)
    target=$1
  fi

  # Expand leading ~ to $HOME
  if [[ $target == ~* ]]; then
    target="${target/#\~/$HOME}"
  fi

  # If it's not already absolute, prepend current directory
  if [[ $target != /* ]]; then
    target="$PWD/$target"
  fi

  # If realpath exists, try to normalize the path (resolve .., symlinks, etc.)
  if command -v realpath >/dev/null 2>&1; then
    target=$(realpath "$target" 2>/dev/null || printf '%s\n' "$target")
  fi

  if [[ ! -e $target ]]; then
    printf 'pick: no such file or directory: %s\n' "$target" >&2
    return 1
  fi

  printf '%s\n' "$target" | pbcopy
  printf 'Copied to clipboard: %s\n' "$target"
}

# Move file/dir from path in the clipboard to the current working directory.
# Usage:
#   drop             # move
#   drop --copy      # copy instead of move
#   drop [dest-dir]  # move into given destination (optional)
drop() {
  local src_path dest_dir operation verb

  src_path=$(pbpaste)
  [[ -z $src_path ]] && { echo "Clipboard is empty."; return 1; }

  # Destination: current dir or first non-flag argument
  dest_dir="."
  if [[ -n $1 && $1 != --copy ]]; then
    dest_dir=$1
  fi

  operation=mv
  verb="Moved"
  if [[ $1 == --copy || $2 == --copy ]]; then
    operation=cp
    verb="Copied"
  fi

  if [[ ! -e $src_path ]]; then
    printf 'No such file or directory: %s\n' "$src_path" >&2
    return 1
  fi

  if [[ ! -d $dest_dir ]]; then
    printf 'Destination is not a directory: %s\n' "$dest_dir" >&2
    return 1
  fi

  # Use -- to stop option parsing in case the path starts with a dash
  if ! $operation -- "$src_path" "$dest_dir"; then
    printf '%s failed: %s -> %s\n' "$verb" "$src_path" \
      "$(cd "$dest_dir" && pwd)"
    return 1
  fi

  printf '%s: %s -> %s\n' "$verb" "$src_path" "$(cd "$dest_dir" && pwd)"
}
