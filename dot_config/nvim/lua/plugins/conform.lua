-- Apply formatting based on file type using external formatters
local function get_uname()
	local uname = vim.loop.os_uname()
	return uname.machine .. "-" .. uname.sysname
end

local function get_formatters_by_ft()
	-- Make sure the first element in the table is the formatters name
	local fmtrs = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		lua = { "stylua" },
		python = { "ruff_format" },
		rust = { "rustfmt" },
		typst = { "prettypst" }, -- Requires cargo to install
	}

	if get_uname() == "x86_64-Linux" then
		fmtrs["nix"] = { "nixfmt" }
	end

	return fmtrs
end

-- Register the formatters in a global table so they can be installed by mason-tool-installer
_G.tools = _G.tools or {}
_G.tools.formatters = function()
	local fmtrs = {}
	for _, fmtr in pairs(get_formatters_by_ft()) do
		-- Yes, this is hacky I know
		if fmtr[1] == "ruff_format" then
			fmtr[1] = "ruff"
		end
		table.insert(fmtrs, fmtr[1])
	end
	return fmtrs
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fmt",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format current buffer",
		},
	},
	opts = {
		formatters_by_ft = get_formatters_by_ft(),
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = { timeout_ms = 500 },
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
