#!/usr/bin/env zsh
set -euo pipefail

################################################################################
# COPYRIGHT (c) 2025 James Chen
#
# Neovim Installer Script (Unix with ZSH)
#
# Installs Neovim by cloning the official repo, building from source, and
# installing via sudo.
#
# Prerequisites: git, make, cmake, sudo
################################################################################

DEST_DIR="${DEST_DIR:-$HOME/.cache/neovim}"
LATEST_RELEASE_BRANCH="${LATEST_RELEASE_BRANCH:-release-0.11}"

log()  { print -r -- "==> $*"; }
warn() { print -r -- "WARN: $*" >&2; }
die()  { print -r -- "ERROR: $*" >&2; exit 1; }

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || die "Missing prerequisite: '$1' not found 
  in PATH"
}

log "Checking prerequisites..."
need_cmd git
need_cmd make
need_cmd cmake
need_cmd sudo
log "All prerequisites found."

# Basic sanity checks
[[ -n "$DEST_DIR" ]] || die "DEST_DIR is empty"
[[ -n "$LATEST_RELEASE_BRANCH" ]] || die "LATEST_RELEASE_BRANCH is empty"

log "Destination directory: $DEST_DIR"
log "Target branch: $LATEST_RELEASE_BRANCH"

log "Ensuring destination parent exists..."
mkdir -p "$(dirname "$DEST_DIR")"

if [[ -d "$DEST_DIR/.git" ]]; then
  log "Existing Neovim git repo found. Updating..."
  cd "$DEST_DIR"
  log "Fetching latest changes..."
  git fetch --all --tags --prune
else
  if [[ -e "$DEST_DIR" && ! -d "$DEST_DIR" ]]; then
    die "DEST_DIR exists but is not a directory: $DEST_DIR"
  fi

  log "Cloning Neovim repository..."
  rm -rf "$DEST_DIR"
  git clone https://github.com/neovim/neovim.git "$DEST_DIR"
  cd "$DEST_DIR"
fi

log "Checking that branch exists: $LATEST_RELEASE_BRANCH"
if ! git show-ref --verify --quiet \
    "refs/remotes/origin/$LATEST_RELEASE_BRANCH";
then
  die "Branch '$LATEST_RELEASE_BRANCH' not found in origin. Available release
  branches: $(git branch -r | grep -E 'origin/release-' | tr '\n' ' ')"
fi

log "Switching to branch '$LATEST_RELEASE_BRANCH'..."
git switch -C "$LATEST_RELEASE_BRANCH" "origin/$LATEST_RELEASE_BRANCH"

log "Starting build (Release)..."
log "This may take a few minutes."
make CMAKE_BUILD_TYPE=Release

log "Installing (sudo required)..."
sudo make install

log "Verifying installation..."
if command -v nvim >/dev/null 2>&1; then
  log "Neovim installed successfully: $(nvim --version | head -n 1)"
else
  warn "Install completed, but 'nvim' not found in PATH. You may need to 
  restart your shell or check your PATH."
fi

log "Done."
