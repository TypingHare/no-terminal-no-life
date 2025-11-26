# Display directories and files
if command -v lsd >/dev/null 2>&1; then
  alias l='lsd --group-directories-first'
  alias tree="lsd --tree --group-directories-first"
else
  alias l='ls'
fi
alias ll="l -l"
alias la="l -lA"

# Set up zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# List all files recursively
function lr() {
  find "${1:-.}" -type f
}

# Grep specific files in the current directory
alias lg="ll | grep"

# Grep specific files recursively
alias lrg="lr | grep"

# A shortcut for the combination of `cd` and `ll`
function to() {
  if command -v z >/dev/null 2>&1; then
    z "$@" && ll
  else
    cd "$@" && ll
  fi
}

alias home="cd $HOME && ll"

# List all commands sorted
alias commands="compgen -c | sort | uniq"
