return {
	c = {
		"clang-format",
		options = {
			IndentWidth = 4,
			UseTab = true,
			BasedOnStyle = "LLVM",
		},
	},
	cpp = {
		"clang-format",
		options = {
			IndentWidth = 4,
			UseTab = true,
			BasedOnStyle = "LLVM",
		},
	},
	lua = {
		"stylua",
		options = {
			indent_width = 4,
			indent_type = "Tabs",
			quote_style = "AutoPreferDouble",
		},
	},
}
