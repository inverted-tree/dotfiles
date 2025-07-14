-- Automatically install LSP servers, linters and formatters
return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{
			-- This is inside the deps for mason-lspconfig, becuase mason needs to be set up before lspc. One could also use the old config = function() ... syntax, but this works just fine and is more idiomatic.
			"williamboman/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "⌛",
						package_uninstalled = "𐄂",
					},
					border = "solid",
					backdrop = 67,
				},
			},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				-- The tools are stored in a global table 'tools' from within the module that requires them to be installed
				ensure_installed = _G.tools.formatters(),
				-- debounce_hours = 8,
			},
		},
	},
	opts = {
		ensure_installed = {
			"clangd",
			"jdtls",
			"lua_ls",
			"rust_analyzer",
		},
	},
}
