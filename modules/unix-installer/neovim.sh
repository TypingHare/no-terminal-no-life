#!/bin/zsh

################################################################################
# COPYRIGHT (c) 2025 James Chen
#
# Neovim Installer Script (Unix with ZSH)
#
# This script installs the latest version of Neovim by downloading the source
# code from the official GitHub repository, compiling it, and installing it on
# the system.
################################################################################

DEST_DIR=~/.cache/neovim
LATEST_RELEASE_BRANCH=release-0.11

# Clone the Neovim repository
git clone https://github.com/neovim/neovim.git "$DEST_DIR"

# Build and install Neovim
cd "$DEST_DIR" &&
  git switch "$LATEST_RELEASE_BRANCH" &&
  make CMAKE_BUILD_TYPE=Release &&
  sudo make install
