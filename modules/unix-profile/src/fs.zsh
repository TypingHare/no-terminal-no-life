# Display directories and files
if command -v lsd >/dev/null 2>&1; then
  alias l='lsd --group-directories-first'
  alias tree="lsd --tree --group-directories-first"
else
  alias l='ls'
fi
alias ll="l -l"
alias la="l -lA"

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
    z "$1" && ll
  else
    cd "$@" && ll
  fi
}

# List all commands sorted
alias commands="compgen -c | sort | uniq"
