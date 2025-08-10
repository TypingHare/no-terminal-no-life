# Debian (Bookworm) setup script

# Install Git and zsh using apt
sudo apt update
sudo apt install git -y
sudo apt install zsh -y
sudo apt install build-essential -y

# Install Oh My Zsh
# Link: https://ohmyz.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install oh-my-zsh plugins
mkdir -p "$ZSH_CUSTOM/plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Update .zshrc
cat <<EOF >~/.zshrc
# Oh My Zsh setup
export ZSH="\$HOME/.oh-my-zsh"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source \$ZSH/oh-my-zsh.sh
EOF

# Make zsh the default shell interpreter
chsh -s "$(which zsh)"

# Install Homebrew (How to make it work automatically?)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
cat <<EOF >~/.zshrc

# Homebrew
eval "\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOF

# Install Starship
brew install starship
cat <<EOF >~/.zshrc

# Starship
eval "\$(starship init zsh)"
EOF

# Set up no-terminal-no-life
mkdir ~/git
NTNL_DIR="$HOME/git/ntnl"
git clone https://github.com/TypingHare/no-terminal-no-life.git "$NTNL_DIR"
"$(which zsh)" "$NTNL_DIR/unix/installer/copy_links.zsh"
cat <<EOF >~/.zshrc

# No Terminal No Life Unix profile
source "$HOME/git/ntnl/unix/profile.zsh"
EOF

# Install tools: fastfetch, htop, lsd, zoxide, fzf, lazygit
brew install fastfetch htop lsd zoxide fzf lazygit

# Install runtime environment: Node.js
brew install node

# Install runtime environment: Rust
brew install rust
cat <<EOF >~/.zshrc

# Rust/Cargo 
export PATH="/Users/james/.cargo/bin:$PATH"
EOF

# Install runtime environment: Go
brew install go

# Install runtime environment: Java
brew install java

# Install Neovim
brew install neovim
