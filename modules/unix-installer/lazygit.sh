#!/bin/zsh

################################################################################
# COPYRIGHT (c) 2025 James Chen
#
# Lazygit Installer Script (Unix | ARM64 | ZSH)
#
# This script installs the latest version of Lazygit by downloading the
# precompiled binary from the official GitHub repository and installing it on
# the system.
################################################################################

# Get the latest version of lazygit
LAZYGIT_VERSION=$(
  curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" |
    grep -Po '"tag_name": *"v\K[^"]*'
)

# Download the lazygit tarball for ARM64 architecture
curl -Lo lazygit.tar.gz \
  "https://github.com/jesseduffield/lazygit/releases/download/v\
  ${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_arm64.tar.gz"

# Extract and install lazygit
tar xf lazygit.tar.gz lazygit

# Install lazygit to /usr/local/bin
sudo install lazygit -D -t /usr/local/bin/

# Clean up
rm lazygit.tar.gz lazygit
