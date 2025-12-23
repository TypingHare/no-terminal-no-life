#! /usr/bin/env zsh

ZSHRC_PATH="$HOME/.zshrc"

echo "Setting up no-terminal-no-life (NTNL) profiles..."
export NTNL_HOME="$HOME/.ntnl"

# Write to .zshrc
echo "\n# NTNL_HOME" >> "$HOME/.zshrc"
echo "export NTNL_HOME=\$HOME/.ntnl" >> "$HOME/.zshrc"

# Build and append unix profile
printf '%s\n' ${(l:80::-:)}
echo "Setting up Linux profile..."
cd "$NTNL_HOME/modules/unix-profile/" && make build
echo "source \"\$NTNL_HOME/modules/unix-profile/build/profile.zsh\"" \
  >> "$ZSHRC_PATH"

# If first argument is `--macos`, also build and append macOS profile
if [[ "$(uname)" == "Darwin" ]]; then
  printf '%s\n' ${(l:80::-:)}
  echo "Setting up macOS profile..."
  cd "$NTNL_HOME/modules/macos-profile/" && make build
  echo "source \"\$NTNL_HOME/modules/macos-profile/build/profile.zsh\"" \
    >> "$ZSHRC_PATH"
fi

# Append a newline to .zshrc
echo "" >> "$ZSHRC_PATH"

printf '%s\n' ${(l:80::-:)}
echo "Completed setup. Please run \`exec zsh\` to load the new profile."
