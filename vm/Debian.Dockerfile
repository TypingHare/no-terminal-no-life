FROM debian:bookworm

# This tells Debian's management tools (apt, dpkg, etc.) to run without
# prompting user for input
ENV DEBIAN_FRONTEND=noninteractive

# We use `apt-get` instead of `apt` because `apt-get` is a low-level tool for
# scripts and backward compatibility, while `apt` is designed for interactive
# use.
#
# Update the local package index
# When this command is executed, `apt-get` contacts all the software
# repositories listed in:
#
#     /etc/apt/sources.list
#     /etc/apt/sources.list.d/
#
# The metadata includes package names, versions, dependencies, and download
# URLs. Essentially, it syncs your machine’s local “catalog” of available
# packages with what’s on the remote repositories.
RUN apt-get update;

# `build-essential` is a meta-package in Debian-based systems that includes a
# collection of essential packages required for compiling and building software
# from source code. It typically includes the GNU Compiler Collection (GCC),
# make, and other necessary development tools and libraries.
RUN apt-get install -y build-essential;

# `sudo` stands for "superuser do". It is a command-line utility that allows a
# permitted user to execute a command as another user, typically the superuser
# (root).
RUN apt-get install -y sudo;

# `procps` is a package that provides a set of utilities for monitoring and
# managing system processes in Unix-like operating systems. It includes tools
# such as `ps`, `top`, `vmstat`, `w`, and `kill`, which are commonly used for
# process management and system monitoring.
RUN apt-get install -y procps;

# `curl` is a command-line tool used to transfer data to or from a server
# using various protocols such as HTTP, HTTPS, FTP, and more.
RUN apt-get install -y curl;

# `wget` is a command-line utility used for downloading files from the web. It
# supports various protocols, including HTTP, HTTPS, and FTP.
RUN apt-get install -y wget;

# CMake is an open-source, cross-platform build system generator. it doesn’t
# build software directly, but instead generates build scripts for your chosen
# build system.
RUN apt-get install -y cmake;

# Vim (Vi IMproved) is a highly configurable text editor built to enable a 
# powerful and efficient text editing experience.
RUN apt-get install -y vim;

# Zsh (Z Shell) is a powerful and versatile Unix shell that serves as both a
# command interpreter and a scripting language. It is an extended version of the
# Bourne Shell (sh) with many additional features and enhancements.
RUN apt-get install -y zsh;

# Git is a distributed version control system designed to handle everything from
# small to very large projects with speed and efficiency.
RUN apt-get install -y git;

# Create an admin user with a home directory and set their default shell to Zsh
RUN useradd -m admin -s /bin/zsh;

# Give the admin user full root privileges, allowing them to run any command
# with `sudo` without entering a password
RUN echo "admin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers;

# Switch to the admin user
USER admin
WORKDIR /home/admin

# Install Rust (with rustup)
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \ 
sh -s -- -y --profile minimal --default-toolchain stable --no-modify-path;
RUN echo >> ~/.zshrc;
RUN echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc;
RUN export PATH="$HOME/.cargo/bin:$PATH";

# Install lsd (a modern replacement for `ls`)
RUN cargo install lsd;

# Install ripgrep (a line-oriented search tool that recursively searches the
# current directory for a regex pattern)
RUN cargo install ripgrep;

# Install zoxide (a smarter cd command, inspired by z and autojump)
RUN cargo install zoxide;

# Install No-Terminal-No-Life
# RUN git clone git@github.com:TypingHare/terminal-life.git;

# Install oh-my-zsh (a delightful, open source, community-driven framework for
# managing your Zsh configuration)
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# To keep the image small, clean up the apt cache after installing packages.
RUN rm -rf /var/lib/apt/lists/*
