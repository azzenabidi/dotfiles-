-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Migrated from Omarchy 3 (migrate-to-quattro.sh)

-- Close window with Super+Q instead of Super+W
hl.unbind("SUPER + W")
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())

-- OpenCode on Super+Shift+O (overrides default Obsidian)
hl.unbind("SUPER + SHIFT + O")
o.bind("SUPER + SHIFT + O", "OpenCode", "uwsm-app -- xdg-terminal-exec --dir=\"$HOME\" opencode")

-- Neovim Cheatsheet on Super+N
o.bind("SUPER + N", "Neovim Cheatsheet", "uwsm-app -- /home/azzen/.local/bin/neovim-cheatsheet")

-- Neovim on Super+E
o.bind("SUPER + E", "Neovim", "uwsm-app -- xdg-terminal-exec nvim")

-- VLC on Super+Shift+V
o.bind("SUPER + SHIFT + V", "VLC", "uwsm-app -- vlc")

-- Omawrite on Super+Shift+T
o.bind("SUPER + SHIFT + T", "Omawrite", "uwsm-app -- omawrite")

-- Windows VM on Super+W
o.bind("SUPER + W", "Windows VM", { launch = "omarchy-windows-vm launch" })

-- Music Library on Super+Shift+M
o.bind("SUPER + SHIFT + M", "Music Library", "uwsm-app -- xdg-terminal-exec /home/azzen/.local/bin/cliamp-music-library")

-- Hexlog on Super+Shift+H
o.bind("SUPER + SHIFT + H", "Hexlog", { launch = "hexlog" })


