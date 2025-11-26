# Path to the root directory of the user's iCloud Drive.
export ICLOUD_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs/"

# Name of the subdirectory within iCloud Drive used for cloud storage.
export CLOUD_DIR_NAME="cloud"

# Full path to the designated cloud storage directory within iCloud Drive.
export CLOUD_DIR="$ICLOUD_DIR/$CLOUD_DIR_NAME"

# Alias for quickly navigating to the cloud storage directory.
alias cloud="cd $CLOUD_DIR"

# Move a specified file into the cloud storage directory.
function mv2cloud() {
  mv "$1" "$CLOUD_DIR/$2"
}

# Copy a specified file into the cloud storage directory.
function cp2cloud() {
  cp "$1" "$CLOUD_DIR/$2"
}
