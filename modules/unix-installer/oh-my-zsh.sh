#!/bin/zsh

################################################################################
# COPYRIGHT (c) 2025 James Chen
#
# Oh My Zsh Installer Script (Unix with ZSH)
# This script installs Oh My Zsh, an open source and community-driven framework
# for managing Zsh configuration.
################################################################################

# Remove the Oh My Zsh directory if it exists
rm -rf ~/.oh-my-zsh

# Set up environment variables so that Oh My Zsh does not run Zsh immediately
# after the installation
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set up plugins
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$ZSH/custom"
mkdir -p "$ZSH_CUSTOM/plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions.git \
  "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Update the Zsh configuration file
cat <<EOF >~/.zshrc
export ZSH="\$HOME/.oh-my-zsh"
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
source \$ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6e6e6e'
EOF
