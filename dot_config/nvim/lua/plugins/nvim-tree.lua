return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local tree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.opt.termguicolors = true

		tree.setup({
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 32,
				relativenumber = true,
			},
			renderer = {
				group_empty = true,
				indent_markers = {
					enable = true,
				},
			},
			filters = {
				dotfiles = true,
				custom = {
					".DS_Store",
				},
			},
			git = {
				ignore = false,
			},
		})

		local keymap = vim.keymap
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", {
			desc = "Toggle file explorer",
		})
		keymap.set("n", "<leader>es", "<cmd>NvimTreeFocus<CR>", {
			desc = "Open if closed and focus file explorer",
		})
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", {
			desc = "Toggle file explorer on current file",
		})
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", {
			desc = "Collapse file explorer",
		})
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", {
			desc = "Refresh file explorer",
		})
	end,
}
