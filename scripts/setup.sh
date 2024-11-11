#!/bin/bash

# exit on error
set -e

# function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# function to ask user for confirmation
ask_user() {
    local prompt=$1
    local response
    echo ""
    read -p "$prompt (y/n): " response
    [[ "$response" == "y" || "$response" == "Y" ]]
}

# check if script is run as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root (use sudo)"
    exit 1
fi

# update package lists
if ask_user "Do you want to update package lists?"; then
    echo "Updating package lists..."
    apt update
fi

# install basic development tools
if ask_user "Do you want to install basic development tools (bat, git, htop, curl, tmux, neovim)?"; then
    echo "Installing basic development tools..."
    apt install -y \
        bat \
        git \
        htop \
        curl \
        tmux \
        neovim
fi

# install compilers and build tools
if ask_user "Do you want to install compilers and build tools (gcc, g++, cmake)?"; then
    echo "Installing compilers and build tools..."
    apt install -y \
        gcc \
        g++ \
        cmake \
        build-essential
fi

# install programming languages and package managers
if ask_user "Do you want to install programming languages (Python, Rust, OCaml, Haskell)?"; then
    # Python
    echo "Installing Python..."
    apt install -y python3 python3-pip python3-venv

    # Rust
    echo "Installing Rust..."
    if ! command_exists cargo; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "$HOME/.cargo/env"
    fi

    # OCaml
    echo "Installing OCaml..."
    apt install -y opam
    opam init --auto-setup --disable-sandboxing

    # Haskell
    echo "Installing Haskell..."
    apt install -y ghc cabal-install

    echo "Installed versions:"
    if command_exists git; then echo "Git: $(git --version)"; fi
    if command_exists python3; then echo "Python: $(python3 --version)"; fi
    if command_exists gcc; then echo "GCC: $(gcc --version | head -n 1)"; fi
    if command_exists cargo; then echo "Cargo: $(cargo --version)"; fi
    if command_exists ghc; then echo "GHC: $(ghc --version)"; fi
    if command_exists opam; then echo "OPAM: $(opam --version)"; fi
    if command_exists cmake; then echo "CMake: $(cmake --version | head -n 1)"; fi

fi

# setup neovim configuration
if ask_user "Do you want to setup Neovim configuration?"; then
    echo "Setting up Neovim configuration..."
    NVIM_CONFIG_DIR="$HOME/.config/nvim"
    PARENT_NVIM_DIR="../nvim"

    # create .config directory if it doesn't exist
    mkdir -p "$HOME/.config"

    # copy nvim configuration from parent directory
    if [ -d "$PARENT_NVIM_DIR" ]; then
        cp -r "$PARENT_NVIM_DIR" "$NVIM_CONFIG_DIR"
        echo "Neovim configuration installed successfully"
    else
        echo "Warning: Could not find nvim configuration in parent directory"
    fi
fi

# setup tmux configuration
if ask_user "Do you want to setup Tmux configuration?"; then
    echo "Setting up Tmux configuration..."
    TMUX_CONFIG="$HOME/tmux.conf"
    PARENT_TMUX_CONFIG="../tmux/tmux.conf"

    # Copy tmux configuration from parent directory
    if [ -f "$PARENT_TMUX_CONFIG" ]; then
        cp "$PARENT_TMUX_CONFIG" "$TMUX_CONFIG"
        echo "Tmux configuration installed successfully"
    else
        echo "Warning: Could not find tmux configuration in parent directory"
    fi
fi

# install tailscale
if ask_user "Do you want to install Tailscale?"; then
    echo "Installing Tailscale..."
    curl -fsSL https://tailscale.com/install.sh | sh
fi

# replace .bashrc
if ask_user "Do you want to replace .bashrc with the one from dotfiles?"; then
    echo "Replacing .bashrc with the one from dotfiles..."
    cp ~/dotfiles/bash/.bashrc ~/.bashrc
fi

# configure git globally
if ask_user "Do you want to configure Git globally?"; then
    echo "Configuring Git global settings..."
    read -p "Enter your Git username: " git_username
    read -p "Enter your Git email: " git_email
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"
    git config --global init.defaultBranch "main"
    echo "Git configured successfully with username: $git_username"
fi

echo -e "\nInstallation process complete!\n"
echo "Note: You may need to restart your shell or source your profile to use some tools"
