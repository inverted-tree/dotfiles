-- Package manager for installing LSP servers, linters and formatters.
local get_formatters = function()
	local fmts = {}
	local seen = {}
	local formatters = require("formatters")

	for _, entry in pairs(formatters) do
		local fmt = entry[1]
		if not seen[fmt] then
			table.insert(fmts, fmt)
			seen[fmt] = true
		end
	end
	return fmts
end

return {
	"williamboman/mason.nvim",
	lazy = false,
	priority = 900,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "⌛",
					package_uninstalled = "𐄂",
				},
			},
		})

		-- A declarative list of installed languages is located at lua/lsp-servers.lua
		mason_lspconfig.setup({
			ensure_installed = require("lsp-servers"),
		})

		mason_tool_installer.setup({
			ensure_installed = get_formatters(),
		})
	end,
}
