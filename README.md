# Dotfiles

Personal configuration for [Omarchy](https://github.com/basecamp/omarchy) (Hyprland-based Arch Linux setup), managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

| Package | Path | Contents |
|---------|------|----------|
| `hypr` | `.config/hypr/` | Hyprland window manager config (keybindings, monitors, appearance, input, idle/lock, etc.) |
| `google-chrome` | `.config/google-chrome/NativeMessagingHosts/` | Native messaging host configs for Omarchy extensions (copy URL, ytdlp) |
| `omarchy` | `.config/omarchy/` | Omarchy shell, branding, extensions, hooks, themes, and Alacritty template |

## Fresh install

### 1. Install prerequisites

```bash
sudo pacman -S --noconfirm git stow
```

### 2. Clone the repo

```bash
git clone https://github.com/azzenabidi/dotfiles-.git ~/dotfiles
```

### 3. Stow the packages

```bash
cd ~/dotfiles
stow -v -t ~ hypr google-chrome omarchy
```

This creates symlinks from `~/.config/` pointing into `~/dotfiles/`.

To stow only specific packages:

```bash
stow -v -t ~ hypr          # Hyprland only
stow -v -t ~ omarchy       # Omarchy only
stow -v -t ~ google-chrome # Chrome native messaging only
```

### 4. Restart Hyprland

Log out and back in, or restart the compositor to apply changes.

## Managing dotfiles

Edit files directly in `~/dotfiles/` — the symlinks keep everything in sync.

```bash
# Edit hyprland config
$EDITOR ~/dotfiles/hypr/.config/hypr/hyprland.conf

# Changes take effect after restart or manual reload
hyprctl reload
```

## Undoing stow

To remove all symlinks (keeps your dotfiles in `~/dotfiles/`):

```bash
stow -D -v -t ~ hypr google-chrome omarchy
```

To remove a single package:

```bash
stow -D -v -t ~ hypr
```

## Updating

Pull latest changes and restow:

```bash
cd ~/dotfiles
git pull
stow -R -v -t ~ hypr google-chrome omarchy
```

## License

MIT
