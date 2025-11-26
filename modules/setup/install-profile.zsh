#! /usr/bin/env zsh

echo "Setting up no-terminal-no-life (NTNL) profiles..."
echo "# NTNL" >> "$HOME/.zshrc"
echo "export NTNL_HOME=\$HOME/.ntnl" >> "$HOME/.zshrc"

# Build and append unix profile
printf '%s\n' ${(l:80::-:)}
echo "Setting up Linux profile..."
cd "$NTNL_HOME/modules/unix-profile/" && make build
echo "source \"\$NTNL_HOME/modules/unix-profile/build/profile.zsh\"" \
  >> "$HOME/.zshrc"

# If first argument is `--macos`, also build and append macOS profile
if [[ "$(uname)" == "Darwin" ]]; then
  printf '%s\n' ${(l:80::-:)}
  echo "Setting up macOS profile..."
  cd "$NTNL_HOME/modules/macos-profile/" && make build
  echo "source \"\$NTNL_HOME/modules/macos-profile/build/profile.zsh\"" \
    >> "$HOME/.zshrc"
fi

printf '%s\n' ${(l:80::-:)}
echo "Completed setup"
