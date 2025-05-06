-- A status bar with the rose-pine theme
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "ColorScheme",
	config = function()
		require("lualine").setup({ options = { theme = "rose-pine" } })
	end,
}
