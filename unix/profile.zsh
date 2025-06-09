# The following commands are often used in listing files and directories.
# LSD is a substitute of the builtin "ls" command with powerful features. The
# link to the GitHub repository of LSD is as follows:
#
#     https://github.com/lsd-rs/lsd
#
# Make sure you have installed LSD before using these commands.
# By default, it groups directory first, so all directories are displayed
# above files. It also sorts by time, so recently updated files or directories
# are at the top.
alias l="lsd --group-directories-first"
alias ll="l -l"
alias la="l -lA"
alias tree="lsd --tree --group-directories-first"

# Grep a specific file in the current directory
alias lg="ll | grep"

# Grep commands in the history list
alias hg="history | grep"

# List all files recursively
function files() {
  find "${1:-.}" -type f
}

# Grep files recursively in the current directory
alias fig="files . | grep"

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

# Use nvim instead of vim
alias vim="nvim"

# I cannot spell zellij right
alias zj="zellij"

# List all commands sorted
alias commands="compgen -c | sort | uniq"

# A fancy alias for exiting the session without pain
alias ':q'="exit"

function collect_files() {
  find "$1" -type f -name '*' -print0 | while IFS= read -r -d '' file; do
    echo "\n==> $file" >>all.txt
    cat "$file" >>all.txt
    echo "" >>all.txt
  done
}
