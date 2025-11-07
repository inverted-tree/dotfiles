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

-- Auto-format specific filetypes on save if the formatters are available
vim.api.nvim_create_augroup("AutoFormat", {})

-- Format Lua files
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.lua",
	group = "AutoFormat",
	callback = function()
		if vim.fn.executable("stylua") == 1 then
			vim.cmd("silent !stylua %")
		end
	end,
})

-- Format Python files
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.py",
	group = "AutoFormat",
	callback = function()
		if vim.fn.executable("ruff") == 1 then
			vim.cmd("silent !ruff format -s %")
		end
	end,
})

-- Format Rust files
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.rs",
	group = "AutoFormat",
	callback = function()
		if vim.fn.executable("rustfmt") == 1 then
			vim.cmd("silent !rustfmt -q %")
		end
	end,
})
