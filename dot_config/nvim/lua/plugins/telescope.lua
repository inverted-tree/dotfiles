return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = {
					"smart",
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})
		telescope.load_extension("fzf")
	end,
	keys = function()
		local builtin = require("telescope.builtin")
		return {
			{ "<leader>ff", builtin.find_files, mode = "n", desc = "Find files in CWD" },
			{ "<leader>fg", builtin.live_grep, mode = "n", desc = "Find string in CWD" },
			{ "<leader>fb", builtin.buffers, mode = "n", desc = "Find buffers ?" },
			{ "<leader>fh", builtin.help_tags, mode = "n", desc = "Find help tags ?" },
		}
	end,
}
