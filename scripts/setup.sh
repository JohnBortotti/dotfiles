#!/bin/bash
echo "#########################################"
echo "   Installation script by JohnBortotti   "
echo "#########################################"
echo ""

# check if Nix is already installed
if ! command -v nix &> /dev/null
then
    # download and install Nix
    echo -e "installing Nix..."
    sh <(curl -L https://nixos.org/nix/install) --daemon
else
    echo -e "Nix is already installed, skipping installation..."
fi

# enable experimental features
echo -e "enabling nix experimental features (commands and flakes)..."
mkdir -p ~/.config/nix
echo -e "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

# check if Home Manager is already installed
if ! command -v home-manager &> /dev/null
then
    # download and install Nix Home Manager
    echo -e "Installing Home Manager..."
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install
else
    echo -e "Home Manager is already installed. Skipping installation..."
fi

# check if the dotfiles directory already exists
if [ -d "$HOME/dotfiles" ]; then
    echo -e "dotfiles directory already exists. Updating repository..."
    cd ~/dotfiles
    git pull
else
    # clone dotfiles repository
    echo -e "cloning dotfiles repository..."
    git clone https://github.com/JohnBortotti/dotfiles.git ~/dotfiles || { echo "cloning failed. Exiting..."; exit 1; }
fi

# nun Home Manager flake
echo -e "running Home Manager flake..."
cd ~/dotfiles/nix/home-manager
nix run .#homeConfigurations.joao.activationPackage

# ask if the user wants to install Tailscale
echo ""
read -p "Do you want to install Tailscale? (y/n): " install_tailscale
if [[ "$install_tailscale" == "y" || "$install_tailscale" == "Y" ]]; then
    echo -e "Installing Tailscale..."
    curl -fsSL https://tailscale.com/install.sh | sh
else
    echo -e "Skipping Tailscale installation..."
fi

# replace .bashrc with the one from dotfiles
echo -e "replacing .bashrc with the one from dotfiles..."
cp ~/dotfiles/bash/.bashrc ~/.bashrc

echo -e "Installation complete!\n\n"
