# Copy the absolute path of a file/directory to the clipboard.
pick() {
  local target

  if [[ $# -eq 0 ]]; then
    # No argument: use current directory
    target=$PWD
  else
    # Argument passed: use it as a path (absolute, relative or ~)
    target=$1
  fi

  # If it's not already absolute, prepend current directory
  if [[ $target != /* ]]; then
    target="$PWD/$target"
  fi

  # If realpath exists, try to normalize the path (resolve .., symlinks, etc.)
  if command -v realpath >/dev/null 2>&1; then
    target=$(realpath "$target" 2>/dev/null || printf '%s\n' "$target")
  fi

  printf '%s\n' "$target" | pbcopy
  printf 'Copied to clipboard: %s\n' "$target"
}

# Move file/dir from path in the clipboard to the current working directory.
# Usage:
#   drop        # move
#   drop --copy # copy instead of move
drop() {
  local src_path dest_dir operation verb

  src_path=$(pbpaste)
  dest_dir="."

  if [[ -z $src_path ]]; then
    echo "Clipboard is empty."
    return 1
  fi

  operation=mv
  verb="Moved"
  if [[ "$1" == "--copy" ]]; then
    operation=cp
    verb="Copied"
  fi

  if [[ ! -e $src_path ]]; then
    printf 'No such file or directory: %s\n' "$src_path"
    return 1
  fi

  # Use -- to stop option parsing in case the path starts with a dash
  if ! $operation -- "$src_path" "$dest_dir"; then
    printf '%s failed: %s -> %s\n' "$verb" "$src_path" "$(pwd)"
    return 1
  fi

  printf '%s: %s -> %s\n' "$verb" "$src_path" "$(pwd)"
}
