FROM debian:bookworm

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN apt-get update

# To keep the image small, we will clean up the apt cache after installing packages.
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

# Set default shell
CMD ["/bin/zsh"]
