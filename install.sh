#!/bin/bash
set -euo pipefail

DOTFILES_REPO="https://github.com/azzenabidi/dotfiles-.git"
DOTFILES_DIR="$HOME/dotfiles"

echo "Installing dependencies..."
sudo pacman -S --noconfirm git stow yay aria2 fuse2 flatpak vlc vlc-plugins-all github-cli

if ! command -v google-chrome &>/dev/null; then
  echo "Installing Google Chrome..."
  yay -S --noconfirm google-chrome
fi

if [ -d "$DOTFILES_DIR" ]; then
  echo "Pulling latest changes..."
  git -C "$DOTFILES_DIR" pull
else
  echo "Cloning dotfiles..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

echo "Stowing dotfiles..."
stow -v -d "$DOTFILES_DIR" -t "$HOME" hypr google-chrome omarchy

echo "Installing local binaries..."
mkdir -p "$HOME/.local/bin"
cp -v "$DOTFILES_DIR"/local/bin/* "$HOME/.local/bin/"
chmod +x "$HOME/.local/bin/"*

echo "Done. Restart Hyprland to apply changes."
