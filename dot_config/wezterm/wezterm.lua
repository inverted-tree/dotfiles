--                _
--  _ _ _ ___ ___| |_ ___ ___ _____
-- | | | | -_|- _|  _| -_|  _|     |
-- |_____|___|___| | |___|_| |_|_|_|
--               |__|
--
-- Configuration of the 'Wezterm' terminal emulator (https://wezterm.org/)

local wezterm = require("wezterm")
local config = wezterm.config_builder()

local get_os_name = function()
	if package.config:sub(1, 1) == "\\" then
		return "windows"
	else
		local handle = io.popen("uname")

		if handle then
			local uname_output = handle:read("*a")
			handle:close()

			if uname_output:lower():find("darwin") then
				return "macos"
			else
				return "linux"
			end
		else
			return "unknown"
		end
	end
end

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.color_scheme = "rose-pine"
config.window_background_opacity = 0.45

if get_os_name() == "macos" then
	config.window_decorations = "RESIZE"
	config.macos_window_background_blur = 20
	config.font_size = 18
end
if get_os_name() == "linux" then
	config.window_decorations = "NONE"
	config.enable_wayland = false
	--	config.kde_window_background_blur = true -- This does only work for wayland native windows, which wezterm crashes in with nvidia drivers...
	config.window_background_opacity = 0.85 -- without background blur this is the lowest values that is usable
	config.font_size = 14
end

-- Replace the default bar with a plugin bar
config.enable_tab_bar = true
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm") -- This needs to be set _after_ the coloscheme
bar.apply_to_config(config, {
	padding = { right = 2 },
	separator = {
		space = 0,
		left_icon = ":",
		right_icon = " ",
		field_icon = " │ ",
	},
	modules = {
		pane = { enabled = false },
		workspace = { enabled = false },
		hostname = { enabled = false },
		username = { icon = wezterm.nerdfonts.fa_user_o },
		clock = { enabled = true, icon = wezterm.nerdfonts.md_clock_outline },
	},
})

-- Set some non-default key combinations
config.keys = {
	{
		key = "m",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "\\",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ args = { "zsh" } }),
	},
	{
		key = "-",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ args = { "zsh" } }),
	},
	{
		key = "s",
		mods = "CMD",
		action = wezterm.action.PaneSelect({ mode = "Activate" }),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
}

return config
