-- Set the colorscheme to rose-pine
return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme rose-pine")
		require("rose-pine").setup({
			variant = "main",
			dark_variant = "main",

			styles = { transparency = true },
		})
	end,
}
