-- Conplements the built-in LSP support with async linting
local function get_uname()
	local uname = vim.loop.os_uname()
	return uname.machine .. "-" .. uname.sysname
end

local function is_installed(exec)
	if vim.fn.executable(exec) == 1 then
		return true
	else
		print("Program '" .. exec .. "' is not available via mason, please install manually!")
		return false
	end
end

local function get_linters_by_ft()
	-- Make sure the first element in the table is the linters name
	local linters = {
		bash = { "bash" },
		c = { "clangtidy" },
		cpp = { "clangtidy" },
		haskell = { "hlint" },
		lua = { "luacheck" },
		python = { "ruff" },
	}

	if is_installed("clippy") then
		linters["rust"] = { "clippy" } -- not available via mason, needs to be installed manually
	end
	if get_uname() == "x86_64-Linux" then
		if is_installed("statix") then
			linters["nix"] = { "statix" } -- not available via mason, needs to be installed manually
		end
	end

	return linters
end

-- Register the linters in a global table so they can be installed by mason-tool-installer
_G.tools = _G.tools or {}
_G.tools.linters = function()
	-- Because basically none of the linter names match the mason registry packages...
	return {
		"clangd", -- for clangtidy
		"luacheck",
		"ruff",
		"shellcheck", -- for bash
		"hlint",
	}
end

return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = get_linters_by_ft()

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({
			"BufEnter",
			"BufWritePost",
			"InsertLeave",
		}, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
	keys = {
		{
			"<leader>l",
			function()
				require("lint").try_lint()
			end,
			mode = "n",
			desc = "Trigger linting for current file",
		},
	},
}
