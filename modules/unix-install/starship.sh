#!/bin/zsh

# Install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Add Starship to zsh configuration
echo >>~/.zshrc
echo 'eval "$(starship init zsh)"' >>~/.zshrc
