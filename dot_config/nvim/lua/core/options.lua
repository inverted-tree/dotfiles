-- Define vanilla vim options
local options = vim.opt

options.number = true
options.relativenumber = true

options.tabstop = 4
options.shiftwidth = 4
options.expandtab = false
options.autoindent = true

options.ignorecase = true
options.smartcase = true

options.cursorline = true

options.termguicolors = true
options.background = "dark"
options.signcolumn = "yes"

options.backspace = "indent,eol,start"

options.clipboard:append("unnamedplus")

options.splitright = true
options.splitbelow = true

options.foldmethod = "manual"
