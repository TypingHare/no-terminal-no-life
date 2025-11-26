#!/bin/zsh

# The source directory containing the dot-config files
UNIX_DOT_CONFIG_DIR="$NTNL_HOME/modules/unix-config/dot-files"

# Check if the source directory exists
[ -d "$UNIX_DOT_CONFIG_DIR" ] || {
  echo "Source directory not found: $UNIX_DOT_CONFIG_DIR"
  exit 1
}

# The target directory for the symbolic links
CONFIG_DIR="$HOME/.config"

# Ensure the target directory exists
mkdir -p "$CONFIG_DIR"

for FILEPATH in "$UNIX_DOT_CONFIG_DIR"/*; do
  # Skip if the item does not exist (in case of no matches)
  [ -e "$FILEPATH" ] || continue

  BASENAME="$(basename "$FILEPATH")"
  TARGET_PATH="$CONFIG_DIR/$BASENAME"

  # Skip if the target already exists or is a symbol link
  if [ -e "$TARGET_PATH" ] || [ -L "$TARGET_PATH" ]; then
    echo "Skipping existing: $TARGET_PATH"
    continue
  fi

  # Create the symbolic link
  ln -s "$FILEPATH" "$TARGET_PATH"
  echo "Linked: $FILEPATH -> $TARGET_PATH"
done
