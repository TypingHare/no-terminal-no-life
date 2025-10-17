alias l="lsd --group-directories-first"
alias ll="l -l"
alias la="l -lA"
alias tree="l --tree"

# List all files recursively
function lr() {
  find "${1:-.}" -type f
}

# Grep specific files in the current directory
alias lg="ll | grep"

# Grep specific files recursively
alias lrg="lr | grep"

# Grep commands in the history list
alias hg="history | grep"

# List all commands sorted
alias commands="compgen -c | sort | uniq"

# A shortcut for the combination of `cd` and `ll`
function to() {
  cd "$@" && ll
}

# A helper function for displaying the help information of an application,
# which is usually accessible with the "--help" option. This function will
# then pipe the help information into less.
function help() {
  # Display the usage if the app name is missing
  if [ -z "$1" ]; then
    echo "Usage: help <app>"
    return 1
  fi

  "$1" --help | less
}

# A fancy alias for exiting the session without pain
alias ':q'="exit"

# Collect all files in a directory and output it to `all.txt`
function collect_files() {
  find "$1" -type f -name '*' -print0 | while IFS= read -r -d '' file; do
    echo -e "\n==> $file" >>all.txt
    if file --mime "$file" | grep -q 'charset=binary'; then
      echo "<binary file>" >>all.txt
    else
      cat "$file" >>all.txt
    fi
    echo "" >>all.txt
  done
}
