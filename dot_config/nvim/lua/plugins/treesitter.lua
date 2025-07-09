-- Incremental parsing library

-- List of parsers that will be installed automatically
local parsers = {
	"bash",
	"c",
	"cpp",
	"css",
	"csv",
	"cuda",
	"diff",
	"dockerfile",
	"doxygen",
	"forth",
	"fortran",
	"go",
	"haskell",
	"html",
	"java",
	"json",
	"latex",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"ninja",
	"nix",
	"python",
	"rust",
	"scala",
	"sql",
	"toml",
	"typst",
	"vim",
	"vimdoc",
	"yaml",
	"zathurarc",
}

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
	opts = {
		ensure_installed = parsers,
		sync_install = false,
		auto_install = true,
		ignore_install = {},
		modules = {},
		highlight = {
			enable = true,
			disable = function(buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},
		indent = { enable = true },
		autotag = { enable = true },
	},
}
