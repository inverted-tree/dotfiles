-- Autocompletion
return {
	"hrsh7th/nvim-cmp",
	event = {
		"InsertEnter",
	},
	-- nvim-cmp does not provide any completions on its own but acts as a framework for applying completions. Thus, completions need to be added as sources to nvim-cmp
	dependencies = {
		-- Source for buffer words
		"hrsh7th/cmp-buffer",
		-- Source for filesystem paths
		"hrsh7th/cmp-path",
		-- Source for nvim api
		"hrsh7th/cmp-nvim-lua",
		-- Lua snippets engine
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		-- Source for Lua snippets
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
