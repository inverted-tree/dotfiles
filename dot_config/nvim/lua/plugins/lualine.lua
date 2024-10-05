
-- Rose-Pine config for lualine

local colors = require("../core/colors/rose-pine")

local rose_pine_theme = {
	normal = {
		a = {
			fg = colors.base,
			bg = colors.iris,
			gui = "bold",
		},
		b = {
			fg = colors.iris,
			bg = colors.highlight_med,
		},
		c = {
			fg = colors.iris,
			bg = colors.highlight_low,
		},
	},
	insert = {
		a = {
			fg = colors.base,
			bg = colors.foam,
			gui = "bold",
		},
		b = {
			fg = colors.foam,
			bg = colors.highlight_med,
		},
		c = {
			fg = colors.foam,
			bg = colors.highlight_low,
		},
	},
	visual = {
		a = {
			fg = colors.base,
			bg = colors.rose,
			gui = "bold",
		},
		b = {
			fg = colors.rose,
			bg = colors.highlight_med,
		},
		c = {
			fg = colors.rose,
			bg = colors.highlight_low,
		},
	},
	command = {
		a = {
			fg = colors.base,
			bg = colors.gold,
			gui = "bold",
		},
		b = {
			fg = colors.gold,
			bg = colors.highlight_med,
		},
		c = {
			fg = colors.gold,
			bg = colors.highlight_low,
		},
	},
	replace = {
		a = {
			fg = colors.base,
			bg = colors.love,
			gui = "bold",
		},
		b = {
			fg = colors.love,
			bg = colors.highlight_med,
		},
		c = {
			fg = colors.love,
			bg = colors.highlight_low,
		},
	},
	inactive = {
		a = {
			fg = colors.base,
			bg = colors.pine,
			gui = "bold",
		},
		b = {
			fg = colors.pine,
			bg = colors.highlight_med,
		},
		c = {
			fg = colors.pine,
			bg = colors.highlight_low,
		},
	},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		lualine.setup({
			options = {
				theme = rose_pine_theme,
			},
		})
	end
}
