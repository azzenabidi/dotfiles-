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

if ! command -v stow &>/dev/null; then
  echo "GNU Stow not found, installing..."
  sudo pacman -S --noconfirm stow
fi

echo "Ensuring target directories exist..."
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

echo "Stowing dotfiles..."
stow -D -v -d "$DOTFILES_DIR" -t "$HOME" --no-folding hypr omarchy opencode
stow -v -d "$DOTFILES_DIR" -t "$HOME" --no-folding hypr omarchy opencode

echo "Installing local binaries..."
if ls "$DOTFILES_DIR"/local/bin/* &>/dev/null; then
  cp -v "$DOTFILES_DIR"/local/bin/* "$HOME/.local/bin/"
  chmod +x "$HOME/.local/bin/"*
fi

echo "Done. Reloading Hyprland and restarting shell bar..."
hyprctl reload
omarchy-restart-shell
