# Install Homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install LSD (See apps/file_system.md)
brew install lsd 

# Install Git
brew install git

# Install zsh and oh-my-zsh
# Use pure as theme (https://github.com/sindresorhus/pure)
brew install zsh
sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
brew install pure
# [Manual] Change ZSH_THEME to "pure"

# Install plugins for oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions                                                                                                     
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

