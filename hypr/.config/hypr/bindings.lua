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
o.bind("SUPER + SHIFT + O", "OpenCode", "uwsm-app -- xdg-terminal-exec --dir=\"$HOME\" opencode --auto")

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

-- Switch keyboard layout (French/Arabic) with Alt+Shift, either key order.
-- non_consuming keeps the combo from triggering Alt menus in apps.
o.bind("ALT + SHIFT_L", "Switch keyboard layout", "hyprctl switchxkblayout all next", { non_consuming = true })
o.bind("ALT + SHIFT_R", "Switch keyboard layout", "hyprctl switchxkblayout all next", { non_consuming = true })
o.bind("SHIFT + ALT_L", "Switch keyboard layout", "hyprctl switchxkblayout all next", { non_consuming = true })
o.bind("SHIFT + ALT_R", "Switch keyboard layout", "hyprctl switchxkblayout all next", { non_consuming = true })

-- TEMP TEST BIND
hl.bind("SUPER + code:28", hl.dsp.exec_cmd("touch /tmp/kb_bind_test2"))
