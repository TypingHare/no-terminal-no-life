#! /bin/sh

# Check the existence of git
if ! command -v git &> /dev/null
then
    echo "Error: git is not installed."
    exit 1
fi

# Install oh-my-zsh
# See https://ohmyz.sh/#install
export RUNZSH=no
cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set up plugins
ZSH="$HOME/.local/share/ohmyzsh"
ZSH_CUSTOM="$ZSH/custom"
mkdir -p "$ZSH_CUSTOM/plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Update .zshrc
echo 'export ZSH="$HOME/.local/share/ohmyzsh"' > ~/.zshrc
echo 'plugins=(' >> ~/.zshrc
echo '    git' >> ~/.zshrc
echo '    zsh-autosuggestions' >> ~/.zshrc
echo '    zsh-syntax-highlighting' >> ~/.zshrc
echo ')' >> ~/.zshrc
echo '' >> ~/.zshrc
echo 'source $ZSH/oh-my-zsh.sh' >> ~/.zshrc

# Reload zsh configuration
source ~/.zshrc

