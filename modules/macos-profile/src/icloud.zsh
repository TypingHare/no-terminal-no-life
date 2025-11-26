# Path to the root directory of the user's iCloud Drive.
export ICLOUD_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

# Name of the subdirectory within iCloud Drive used for cloud storage.
export CLOUD_DIR_NAME="cloud"

# Full path to the designated cloud storage directory within iCloud Drive.
export CLOUD_DIR="$ICLOUD_DIR/$CLOUD_DIR_NAME"

# Alias for quickly navigating to the cloud storage directory.
alias cloud='cd \"$CLOUD_DIR\"'

# Ensures CLOUD_DIR exists (optional: create automatically)
ensure_cloud_dir() {
  if [[ ! -d $CLOUD_DIR ]]; then
    echo "Cloud directory does not exist: $CLOUD_DIR"
    return 1
  fi
}

# Move a specified file or directory into the cloud storage directory.
# Usage:
#   mv2cloud file              → moves into CLOUD_DIR with same name
#   mv2cloud file newname.txt  → moves and renames inside CLOUD_DIR
mv2cloud() {
  ensure_cloud_dir || return 1

  if [[ -z $1 ]]; then
    echo "Usage: mv2cloud <source> [target-name]"
    return 1
  fi

  local src=$1
  local dest_name=${2:-$(basename "$src")}
  local dest="$CLOUD_DIR/$dest_name"

  if [[ ! -e $src ]]; then
    echo "No such file or directory: $src"
    return 1
  fi

  mv -- "$src" "$dest" && \
    echo "Moved: $src → $dest"
}

# Copy a specified file or directory into the cloud storage directory.
# Usage:
#   cp2cloud file
#   cp2cloud file newname.ext
cp2cloud() {
  ensure_cloud_dir || return 1

  if [[ -z $1 ]]; then
    echo "Usage: cp2cloud <source> [target-name]"
    return 1
  fi

  local src=$1
  local dest_name=${2:-$(basename "$src")}
  local dest="$CLOUD_DIR/$dest_name"

  if [[ ! -e $src ]]; then
    echo "No such file or directory: $src"
    return 1
  fi

  cp -R -- "$src" "$dest" && \
    echo "Copied: $src → $dest"
}
