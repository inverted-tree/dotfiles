-- A lightweight vimrc as an alternative to the more IDE-like config in ~/.config/nvim

-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.backspace = "indent,eol,start"
vim.opt.foldmethod = "manual"

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

