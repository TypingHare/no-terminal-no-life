#!/bin/zsh

# Define the custom directory for ZSH
ZSH_CUSTOM="$HOME/.zsh/custom"
mkdir -p $ZSH_CUSTOM/plugins

# Define repositories
ZSH_AUTOSUGGESTIONS_REPOSITORY="https://github.com/zsh-users/zsh-autosuggestions"
ZSH_SYNTAX_HIGHLIGHTING_REPOSITORY="https://github.com/zsh-users/zsh-syntax-highlighting"

# Define plugin directories
ZSH_AUTOSUGGESTIONS_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
ZSH_SYNTAX_HIGHLIGHTING_DIR="$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Clone zsh-autosuggestions if it doesn't exist
if [ ! -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
  echo "Cloning zsh-autosuggestions..."
  git clone $ZSH_AUTOSUGGESTIONS_REPOSITORY $ZSH_AUTOSUGGESTIONS_DIR
else
  echo "zsh-autosuggestions already exists."
fi

# Clone zsh-syntax-highlighting if it doesn't exist
if [ ! -d "$ZSH_SYNTAX_HIGHLIGHTING_DIR" ]; then
  echo "Cloning zsh-syntax-highlighting..."
  git clone $ZSH_SYNTAX_HIGHLIGHTING_REPOSITORY $ZSH_SYNTAX_HIGHLIGHTING_DIR
else
  echo "zsh-syntax-highlighting already exists."
fi

