-- Incremental parsing library
return {
	"nvim-treesitter/nvim-treesitter",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = require("options.ts-parsers"),
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			modules = {},
			highlight = {
				enable = true,
				-- disable = function(buf)
				-- 	local max_filesize = 100 * 1024 -- 100 KB
				-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				-- 	if ok and stats and stats.size > max_filesize then
				-- 		return true
				-- 	end
				-- end,
			},
			indent = { enable = true },
			autotag = { enable = true },
			-- 	incremental_selection = {
			-- 		enable = true,
			-- 		keymaps = {
			-- 			init_selection = "<C-space>",
			-- 			scope_incremental = false,
			-- 			node_incremental = "<bs>",
			-- 		},
			-- 	},
		})
	end,
}
