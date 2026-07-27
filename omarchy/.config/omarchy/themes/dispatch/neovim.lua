# Dispatch - neovim colorscheme
vim.g.colors_name = "dispatch"

local colors = {
  bg = "#0a0e17",
  fg = "#e0e4ec",
  cursor = "#1e90ff",
  selection = "#1e90ff",
  red = "#dc143c",
  green = "#20b2aa",
  yellow = "#ff8c00",
  blue = "#1e90ff",
  magenta = "#7b68ee",
  cyan = "#00ced1",
  dark_bg = "#060a12",
  lighter_bg = "#12161f",
  muted = "#3a3f4b",
}

local hl = vim.api.nvim_set_hl

hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
hl(0, "Cursor", { fg = colors.bg, bg = colors.cursor })
hl(0, "Visual", { bg = colors.selection })
hl(0, "LineNr", { fg = colors.muted })
hl(0, "CursorLineNr", { fg = colors.blue })
hl(0, "Search", { fg = colors.bg, bg = colors.yellow })
hl(0, "IncSearch", { fg = colors.bg, bg = colors.blue })
hl(0, "Comment", { fg = colors.muted, italic = true })
hl(0, "String", { fg = colors.green })
hl(0, "Number", { fg = colors.yellow })
hl(0, "Boolean", { fg = colors.yellow })
hl(0, "Function", { fg = colors.blue })
hl(0, "Keyword", { fg = colors.magenta })
hl(0, "Statement", { fg = colors.magenta })
hl(0, "Type", { fg = colors.cyan })
hl(0, "Identifier", { fg = colors.fg })
hl(0, "PreProc", { fg = colors.magenta })
hl(0, "Special", { fg = colors.cyan })
hl(0, "Error", { fg = colors.red })
hl(0, "Todo", { fg = colors.yellow, bold = true })
hl(0, "StatusLine", { fg = colors.fg, bg = colors.dark_bg })
hl(0, "StatusLineNC", { fg = colors.muted, bg = colors.dark_bg })
hl(0, "Pmenu", { fg = colors.fg, bg = colors.lighter_bg })
hl(0, "PmenuSel", { fg = colors.bg, bg = colors.blue })
hl(0, "SignColumn", { bg = colors.bg })
hl(0, "ColorColumn", { bg = colors.lighter_bg })
hl(0, "VertSplit", { fg = colors.muted })
hl(0, "Title", { fg = colors.blue, bold = true })
hl(0, "Underlined", { underline = true })
