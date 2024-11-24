#! /bin/zsh

DIR="$(cd "$(dirname "$0")" && pwd)"

cd "$DIR" || exit
osascript center.applescript
