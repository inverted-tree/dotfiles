
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
	config = function(_, opts)
		local highlight = {
			"Iris",
			"Foam",
			"Rose",
			"Pine",
			"Gold",
			"Love",
			"White",
		}

		local colors = require("../core/colors/rose-pine")
		local hooks = require "ibl.hooks"
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "Iris", { fg = colors.iris })
			vim.api.nvim_set_hl(0, "Foam", { fg = colors.foam })
			vim.api.nvim_set_hl(0, "Rose", { fg = colors.rose })
			vim.api.nvim_set_hl(0, "Pine", { fg = colors.pine })
			vim.api.nvim_set_hl(0, "Gold", { fg = colors.gold })
			vim.api.nvim_set_hl(0, "Love", { fg = colors.love })
			vim.api.nvim_set_hl(0, "White", { fg = colors.text })
		end)

		require("ibl").setup {
			indent = {
				highlight = highlight,
				char = "┊",
			},
		}
	end
}

