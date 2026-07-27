# Dotfiles

Personal configuration for [Omarchy](https://github.com/basecamp/omarchy) (Hyprland-based Arch Linux setup), managed with [GNU Stow](https://www.gnu.org/software/stow/).

> **Note:** These dotfiles are for **Omarchy 4** (currently alpha 2).

## What's included

| Package | Path | Contents |
|---------|------|----------|
| `hypr` | `.config/hypr/` | Hyprland window manager config (keybindings, monitors, appearance, input, idle/lock, etc.) |
| `google-chrome` | `.config/google-chrome/NativeMessagingHosts/` | Native messaging host configs for Omarchy extensions (copy URL, ytdlp) |
| `omarchy` | `.config/omarchy/` | Omarchy shell, branding, extensions, hooks, themes, and Alacritty template |

## Fresh install

```bash
curl -sL https://raw.githubusercontent.com/azzenabidi/dotfiles-/main/install.sh | bash
```

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
