FROM debian:bullseye

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN apt-get update
RUN apt-get install -y --no-install-recommends
RUN apt-get install -y build-essential
RUN apt-get install -y zstd
RUN apt-get install -y procps
RUN apt-get install -y sudo
RUN apt-get install -y gcc
RUN apt-get install -y cmake
RUN apt-get install -y zsh
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y procps
RUN rm -rf /var/lib/apt/lists/*

# Install lsd
RUN curl -LO https://github.com/lsd-rs/lsd/releases/download/v1.1.5/lsd-musl_1.1.5_arm64.deb
RUN ar x lsd-musl_1.1.5_arm64.deb
RUN mkdir -p lsd
RUN tar --use-compress-program=unzstd -xf data.tar.zst -C lsd
RUN sudo cp lsd/usr/bin/lsd /usr/local/bin/

# Create admin
RUN useradd -m -s /bin/zsh admin && echo "admin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER admin
WORKDIR /home/admin

# Install Homebrew (Yet support Linux AMR64)
# See: https://brew.sh
# RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# RUN echo >> ~/.zshrc
# RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
# RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Clone no-terminal-no-life and run the installers
RUN mkdir -p ~/git
RUN git clone https://github.com/TypingHare/no-terminal-no-life.git ~/git/ntnl
RUN ~/git/ntnl/unix/installer/ohmyzsh.installer.sh
RUN ~/git/ntnl/unix/installer/copy_links.zsh
RUN echo "source ~/git/ntnl/unix/profile.zsh" >> ~/.zshrc

# Install Neovim
RUN git clone https://github.com/neovim/neovim.git ~/git/neovim
RUN cd ~/git/neovim && git switch release-0.11 && make CMAKE_BUILD_TYPE=Release && sudo make install

# Install Starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y
RUN echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Set up SSH keys
RUN mkdir -p ~/.ssh
RUN cd ~/.ssh && ssh-keygen -t ed25519 -C "docker-debian"

# Set default shell
CMD ["/bin/zsh"]
