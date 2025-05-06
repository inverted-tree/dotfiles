-- Define general keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open a new tab" })

keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close the current tab" })
