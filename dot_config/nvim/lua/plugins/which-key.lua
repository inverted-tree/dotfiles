-- Show available keymaps as you type.
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		win = {
			border = "rounded",
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({
					global = false,
				})
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
