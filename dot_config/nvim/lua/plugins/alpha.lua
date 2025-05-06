local banner = {
	[[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
}

local banner_size = function()
	local max_length = 0
	local utf8len = function(s)
		local _, count = s:gsub("[^\128-\191]", "")
		return count
	end
	for _, str in ipairs(banner) do
		local length = utf8len(str)
		max_length = (length > max_length) and length or max_length
	end
	return max_length
end

return {
	"goolord/alpha-nvim",
	dependencies = { "BlakeJC94/alpha-nvim-fortune" },
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local separator = {
			type = "text",
			val = function()
				local bar = ""
				for _ = 1, banner_size(), 1 do
					bar = bar .. "─"
				end
				return bar
			end,
			opts = { position = "center", hl = "SeparatorHighlight" },
		}
		dashboard.config.layout = {
			{ type = "padding", val = 1 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			separator,
			dashboard.section.footer,
		}

		dashboard.section.header.val = banner
		dashboard.section.header.opts.hl = "HeaderHighlight"

		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find Files", ":Telescope find_files<cr>"),
			dashboard.button("g", "  Find String", ":Telescope live_grep<cr>"),
			dashboard.button("m", "  Bookmarks", ":Telescope marks<cr>"),
			dashboard.button("c", "  Configuration", ":e $HOME/.config/nvim<cr>"),
			dashboard.button("l", "󰒲  Package Manager", ":Lazy<cr>"),
			dashboard.button("q", "  Quit", ":qa<cr>"),
		}
		dashboard.section.buttons.opts.hl = "ButtonHighlight"

		local fortune = require("alpha.fortune")
		dashboard.section.footer.val = fortune({ max_width = banner_size() })
		dashboard.section.footer.opts.hl = "FooterHighlight"

		alpha.setup(dashboard.opts)

		local colors = require("..options.colors")
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		vim.api.nvim_set_hl(0, "HeaderHighlight", { fg = colors.gold })
		vim.api.nvim_set_hl(0, "SeparatorHighlight", { fg = colors.highlight_high })
		vim.api.nvim_set_hl(0, "FooterHighlight", { fg = colors.rose })
	end,
}
