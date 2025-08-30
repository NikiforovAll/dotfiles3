#!/bin/bash

set -e  # Exit on any error

echo "🏹 Complete Arch Linux setup starting..."

# Colors for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

# Step 1: Update system and install official packages
print_step "Installing official repository packages..."

sudo pacman -Sy

sudo pacman -S --needed --noconfirm \
    base-devel \
    git \
    curl \
    wget \
    btop \
    zsh \
    unzip \
    fzf \
    bat \
    fd \
    github-cli \
    tokei \
    lsd \
    lazygit

print_success "Official packages installed!"

# Step 2: Install yay if not present
if ! command -v yay &> /dev/null; then
    print_step "Installing yay AUR helper..."
    
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd - > /dev/null
    rm -rf /tmp/yay
    
    print_success "yay installed!"
else
    print_success "yay already installed!"
fi

# Step 3: Install AUR packages
print_step "Installing AUR packages..."

yay -S --needed --noconfirm \
    oh-my-posh \
    lazydocker

print_success "AUR packages installed!"

# Step 4: Post-installation setup
print_step "Running post-installation setup..."

echo ""
print_success "🎉 Complete Arch setup finished!"
echo ""
echo "📋 Installed tools:"
echo "  • fzf          - Fuzzy finder"
echo "  • bat          - Better cat with syntax highlighting"
echo "  • fd           - Better find command"
echo "  • lazygit      - Terminal UI for git"
echo "  • lazydocker   - Terminal UI for docker"
echo "  • tokei        - Code statistics"
echo "  • github-cli   - GitHub command line tool"
echo "  • oh-my-posh   - Cross-platform prompt theme engine"