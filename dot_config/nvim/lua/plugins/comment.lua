-- Easily toggle language specific code comments
return {
	"numToStr/Comment.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	opts = function()
		local ts_ctxt_cstr = require("ts_context_commentstring.integrations.comment_nvim")
		return {
			pre_hook = ts_ctxt_cstr.create_pre_hook(),
		}
	end,
}
