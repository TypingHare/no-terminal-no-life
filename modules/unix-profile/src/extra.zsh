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
