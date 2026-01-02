#!/usr/bin/env zsh

set -euo pipefail

log()  { print -r -- "==> $*"; }
warn() { print -r -- "WARN: $*" >&2; }
die()  { print -r -- "ERROR: $*" >&2; exit 1; }

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || die "Missing prerequisite: '$1' not found 
  in PATH"
}

log "Checking prerequisites..."
need_cmd curl
need_cmd sh
log "Prerequisites OK."

ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"
STARSHIP_LINE='eval "$(starship init zsh)"'
HEADER_LINE='# Starship'

log "Installing Starship..."
# Use -f to fail on HTTP errors; keep output quiet-ish but still show failures.
curl -fsSL https://starship.rs/install.sh | sh -s -- -y

log "Verifying Starship installation..."
if ! command -v starship >/dev/null 2>&1; then
  die "Starship installed script ran, but 'starship' not found in PATH."
fi
log "Installed: $(starship --version)"

log "Ensuring $ZSHRC exists..."
touch "$ZSHRC"

log "Updating $ZSHRC (without duplicates)..."
if grep -Fqx "$STARSHIP_LINE" "$ZSHRC"; then
  log "Starship init line already present. Skipping .zshrc update."
else
  {
    print -r -- ""
    print -r -- "$HEADER_LINE"
    print -r -- "$STARSHIP_LINE"
  } >> "$ZSHRC"
  log "Added Starship init to $ZSHRC."
fi

log "Done. Restart your terminal or run: source \"$ZSHRC\""
