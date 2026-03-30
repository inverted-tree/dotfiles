vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter" },
})

require("nvim-treesitter").install({
	"bash",
	"c",
	"cpp",
	"css",
	"cuda",
	"hcl",
	"html",
	"lua",
	"make",
	"python",
	"typst",
	"yaml",
	"rust",
	"zig",
})
