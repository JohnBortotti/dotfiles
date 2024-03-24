#!/bin/bash

echo -e "\nInstallation script by JohnBortotti\n\n"

# Check if Nix is already installed
if ! command -v nix &> /dev/null
then
    # Download and install Nix
    echo -e "installing Nix...\n"
    sh <(curl -L https://nixos.org/nix/install) --daemon
else
    echo -e "Nix is already installed, skipping installation...\n"
fi

# Enable experimental features
echo -e "enabling nix experimental features (commands and flakes)...\n"
mkdir -p ~/.config/nix
echo -e "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

# Download and install Nix Home Manager
echo -e "installing Home Manager...\n"
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Clone dotfiles repository
echo -e "cloning dotfiles repository...\n"
git clone https://github.com/JohnBortotti/dotfiles.git ~/dotfiles

# Run Home Manager flake
echo -e "running Home Manager flake...\n"
cd ~/dotfiles/nix/home-manager
nix run .#homeConfigurations.joao.activationPackage

# Download and install Tailscale
echo -e "installing Tailscale...\n\n"
curl -fsSL https://tailscale.com/install.sh | sh

# Replace .bashrc with the one from dotfiles
echo -e "replacing .bashrc with the one from dotfiles...\n"
cp ~/dotfiles/bash/.bashrc ~/.bashrc

echo -e "\nInstallation complete!\n\n"
