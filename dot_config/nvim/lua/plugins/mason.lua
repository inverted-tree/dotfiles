-- Automatically install LSP servers, linters and formatters
return {
	"williamboman/mason.nvim",
	dependencies = {
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				-- The tools are stored in a global table 'tools' from within the module that requires them to be installed
				ensure_installed = _G.tools.formatters(),
				debounce_hours = 0,
			},
		},
	},
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
}
