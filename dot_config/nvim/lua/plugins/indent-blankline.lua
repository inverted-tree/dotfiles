vim.pack.add({
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim", name = "indent-blankline" },
})

require("ibl").setup({ indent = { char = "┊" } })
