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

		local keymap = vim.keymap
		local builtin = require('telescope.builtin')

		keymap.set(
			'n',
			'<leader>ff',
			builtin.find_files,
			{ desc = "Fuzzy find files in cwd" }
		)
		keymap.set(
			'n',
			'<leader>fg',
			builtin.live_grep,
			{ desc = "?" }
		)
		keymap.set(
			'n',
			'<leader>fb',
			builtin.buffers,
			{ desc = "?" }
		)
		keymap.set(
			'n',
			'<leader>fh',
			builtin.help_tags,
			{ desc = "?" }
		)
		keymap.set(
			'n',
			'<leader>ft',
			"<cmd>TodoTelescope<cr>",
			{ desc = "Find TODOs" }
		)
	end
}

