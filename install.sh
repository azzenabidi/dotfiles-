#!/bin/bash
set -euo pipefail

DOTFILES_REPO="https://github.com/azzenabidi/dotfiles-.git"
DOTFILES_DIR="$HOME/dotfiles"
PACKAGES=(hypr omarchy opencode cliamp)

echo "Installing dependencies..."
sudo pacman -S --noconfirm git stow yay aria2 fuse2 flatpak vlc vlc-plugins-all github-cli

if ! command -v google-chrome &>/dev/null; then
  echo "Installing Google Chrome..."
  yay -S --noconfirm google-chrome
fi

if ! command -v VBoxManage &>/dev/null; then
  echo "Installing VirtualBox..."
  sudo pacman -S --needed --noconfirm virtualbox virtualbox-host-dkms vde2 virtualbox-guest-iso virtualbox-ext-vnc virtualbox-sdk
  sudo usermod -aG vboxusers "$USER"
  sudo modprobe vboxdrv
  sudo modprobe vboxnetadp
  sudo modprobe vboxnetflt
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

# A fresh Omarchy install already creates these dirs with default files, which
# would abort stow on conflicts. Move any real file stow will replace with a
# symlink into a timestamped backup so stow never touches them in place.
backup_dir="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
for pkg in "${PACKAGES[@]}"; do
  while IFS= read -r src; do
    rel="${src#"$DOTFILES_DIR/$pkg/"}"
    target="$HOME/$rel"
    if [[ -f "$target" && ! -L "$target" ]]; then
      mkdir -p "$backup_dir/$(dirname "$rel")"
      mv "$target" "$backup_dir/$rel"
      echo "Backed up $rel -> $backup_dir/$rel"
    fi
  done < <(find "$DOTFILES_DIR/$pkg" -type f)
done

echo "Stowing dotfiles..."
stow -D -v -d "$DOTFILES_DIR" -t "$HOME" --no-folding "${PACKAGES[@]}"
stow -v -d "$DOTFILES_DIR" -t "$HOME" --no-folding "${PACKAGES[@]}"

echo "Installing local binaries..."
if ls "$DOTFILES_DIR"/local/bin/* &>/dev/null; then
  cp -v "$DOTFILES_DIR"/local/bin/* "$HOME/.local/bin/"
  chmod +x "$HOME/.local/bin/"*
fi

echo "Done. Reloading Hyprland and restarting shell bar..."
hyprctl reload
omarchy-restart-shell
