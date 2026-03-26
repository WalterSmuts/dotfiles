#!/bin/bash
set -euo pipefail

# Ubuntu bootstrap for dotfiles setup

### System packages
sudo apt-get update
sudo apt-get install -y \
    sway swaylock swayidle sway-backgrounds \
    waybar kanshi mako-notifier \
    rofi grim slurp cliphist wl-clipboard \
    brightnessctl udiskie blueman network-manager-gnome \
    neovim fzf stow jq

### Alacritty (not in Ubuntu repos, install via cargo)
if ! command -v alacritty &>/dev/null; then
    if ! command -v cargo &>/dev/null; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        . "$HOME/.cargo/env"
    fi
    cargo install alacritty
fi

### Stow dotfiles
cd "$(dirname "$0")"
stow -t ~ bash nvim sway waybar rofi mako kanshi vim git

echo "Done. Create ~/.bashrc.local and ~/.gitconfig.local for machine-specific config."
