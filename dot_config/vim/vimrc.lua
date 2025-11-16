--      _
--  _ _|_|_____ ___ ___
-- | | | |     |  _|  _|
--  \_/|_|_|_|_|_| |___|
--
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

-- Netrw options
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_list_hide = "(^|ss)\zs.S+"
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = "cp -r"
vim.api.nvim_set_hl(0, "netrwMarkFile", { link = "Search" })

-- Replace grep with rg if available
if vim.fn.executable("rg") == 1 then
	vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
	vim.opt.grepformat = "%f:%l:%c:%m"

	vim.api.nvim_create_user_command("Rg", function(opts)
		vim.cmd("grep " .. opts.args)
	end, { nargs = "+" })
end

-- Highlight the yanked text selection
vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	group = "HighlightYank",
	desc = "Highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 200, visual = true })
	end,
})

-- Disable cursorline on non-active buffers
vim.api.nvim_create_augroup("ActiveCursorline", {})
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = "ActiveCursorline",
	callback = function()
		vim.opt_local.cursorline = true
	end,
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = "ActiveCursorline",
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

-- Auto-format specific filetypes on save if the formatters are available
vim.api.nvim_create_augroup("AutoFormat", {})

-- Format Lua files
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.lua",
	group = "AutoFormat",
	callback = function()
		if vim.fn.executable("stylua") == 1 then
			if vim.fn.expand("%:t") == "xmake.lua" then
				return
			end
			vim.cmd([[silent !stylua %]])
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
