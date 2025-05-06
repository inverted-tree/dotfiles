-- Highlight and manage TODO comments
return {
	"folke/todo-comments.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{ "<leader>tq", ":TodoQuickFix<cr>", desc = "Show TODOs as quick fix list" },
		{ "<leader>tt", ":TodoTelescope<cr>", desc = "Show TODOs inside Telescope" },
	},
}
