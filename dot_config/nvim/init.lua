--                  _                      ___ _
--  ___ ___ ___ _ _|_|_____    ___ ___ ___|  _|_|___
-- |   | -_| . | | | |     |  |  _| . |   |  _| | . |
-- |_|_|___|___|\_/|_|_|_|_|  |___|___|_|_|_| |_|_  |
--                                              |___|

require("plugins")

vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.api.nvim_set_option("clipboard", "unnamedplus")

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

-- Replace grep with rg if available
if vim.fn.executable("rg") == 1 then
	vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
	vim.opt.grepformat = "%f:%l:%c:%m"

	vim.api.nvim_create_user_command("Rg", function(opts)
		vim.cmd("grep " .. opts.args)
	end, { nargs = "+" })
end
