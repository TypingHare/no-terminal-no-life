# Display directories and files
if command -v lsd >/dev/null 2>&1; then
  alias l='lsd --group-directories-first'
  alias tree='lsd --tree --group-directories-first'
else
  alias l='ls'
  # Use tree if available; otherwise leave `tree` unset
  if command -v tree >/dev/null 2>&1; then
    alias tree='tree'
  fi
fi

alias ll='l -l'
alias la='l -lA'

# List all files recursively
lr() {
  find "${1:-.}" -type f
}

# Grep specific files in the current directory
alias lg="ll | grep"

# Grep specific files recursively
alias lrg="lr | grep"

# A shortcut for the combination of `cd`/`z` and `ll`
to() {
  if command -v z >/dev/null 2>&1; then
    z "$@" && ll
  else
    cd "$@" && ll
  fi
}

# List all commands sorted
commands() {
  print -l ${(ok)commands} | sort -u
}

# Set up zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi
