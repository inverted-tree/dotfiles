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
		local ts = require("nvim-treesitter.configs")

		ts.setup({
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			ensure_installed = require("../ts-parsers"),
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					scope_incremental = false,
					node_incremental = "<bs>",
				},
			},
		})
	end,
}
