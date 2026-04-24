vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		name = "nvim-treesitter",
		version = "main",
	},
})

local ts = require("nvim-treesitter")

-- Install the following parsers
ts.install({
	"bash",
	"c",
	"cpp",
	"css",
	"cuda",
	"commonlisp",
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

vim.o.foldlevelstart = 99

-- Register parser-specific functionality for corresponding file types
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		-- Use treesitter-based highlighting
		local ok = pcall(vim.treesitter.start, args.buf)
		if not ok then
			return  -- short-circuit if no parser is available
		end

		-- Enable treesitter-based folds
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldmethod = "expr"
		vim.o.foldlevel = 99

		-- Base indent on treesitter (experimental)
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
