local o = vim.opt

-- numbering
o.relativenumber = true
o.number = true

-- indentation
o.tabstop = 4
o.autoindent = true
o.expandtab = true
o.wrap = false

o.cursorline = true
o.mouse:append("a");
o.clipboard:append("unnamedplus")

-- new window
o.splitright = true
o.splitbelow = true

o.termguicolors = true
o.signcolumn = "yes"

-- theme
vim.cmd.colorscheme "catppuccin-macchiato"
local catpc = require('catppuccin')
catpc.setup {
        transparent_background = true,
}
