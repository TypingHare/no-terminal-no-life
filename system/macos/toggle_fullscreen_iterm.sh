#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
cd "$SCRIPT_DIR"

osascript toggle_fullscreen_iterm.applescript
