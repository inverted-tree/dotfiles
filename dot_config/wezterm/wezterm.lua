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

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		-- if no override is setup, override the default opacity value with 1.0
		overrides.window_background_opacity = 1.0
	else
		-- if there is an override, make it nil so the opacity goes back to the default
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

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

-- wezterm.plugin.require("https://github.com/inverted-tree/bar.wezterm")
-- local bar = wezterm.plugin.require("https://github.com/inverted-tree/bar.wezterm") -- This needs to be set _after_ the coloscheme
local bar = wezterm.plugin.require("file:///Users/lukas/Projects/bar.wezterm")
bar.apply_to_config(config, {
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
		username = { icon = wezterm.nerdfonts.fa_user_o, weight = 2 },
		clock = { enabled = true, icon = wezterm.nerdfonts.md_clock_outline, weight = 3 },
		cwd = { weight = 1 },
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
	{
		key = "o",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("toggle-opacity"),
	},
}

return config
