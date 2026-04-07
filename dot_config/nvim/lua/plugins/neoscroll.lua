vim.pack.add({
	{ src = "https://github.com/karb94/neoscroll.nvim", name = "neoscroll" },
})

local scroll = require("neoscroll")

scroll.setup()
