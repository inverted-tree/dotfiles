-- ▀█▀ ██▀ █▀▄ █▄ ▄█ █ █▄ █ ▄▀▄ █     ▄▀▀ ▄▀▄ █▄ █ █▀ █ ▄▀
--  █  █▄▄ █▀▄ █ ▀ █ █ █ ▀█ █▀█ █▄▄   ▀▄▄ ▀▄▀ █ ▀█ █▀ █ ▀▄█
--
-- ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀ ▀▀
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- █▄█ ██▀ █   █▀▄ ██▀ █▀▄ ▄▀▀
-- █ █ █▄▄ █▄▄ █▀  █▄▄ █▀▄ ▄██
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

-- █▀ ▄▀▄ █▄ █ ▀█▀
-- █▀ ▀▄▀ █ ▀█  █
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16

-- ▄▀▀ ▄▀▄ █   ▄▀▄ █▀▄ ▄▀▀ ▄▀▀ █▄█ ██▀ █▄ ▄█ ██▀
-- ▀▄▄ ▀▄▀ █▄▄ ▀▄▀ █▀▄ ▄██ ▀▄▄ █ █ █▄▄ █ ▀ █ █▄▄
config.color_scheme = "rose-pine"

-- █   █ █ █▄ █ █▀▄ ▄▀▄ █   █   █▀▄ ██▀ ▄▀▀ ▄▀▄ █▀▄ ▄▀▄ ▀█▀ █ ▄▀▄ █▄ █ ▄▀▀
-- ▀▄▀▄▀ █ █ ▀█ █▄▀ ▀▄▀ ▀▄▀▄▀   █▄▀ █▄▄ ▀▄▄ ▀▄▀ █▀▄ █▀█  █  █ ▀▄▀ █ ▀█ ▄██
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.67

if get_os_name() == "macos" then
	config.macos_window_background_blur = 24
end

-- ▄▀▀ █ █ ▄▀▀ ▀█▀ ▄▀▄ █▄ ▄█   ▀█▀ ▄▀▄ ██▄   ██▄ ▄▀▄ █▀▄
-- ▀▄▄ ▀▄█ ▄██  █  ▀▄▀ █ ▀ █    █  █▀█ █▄█   █▄█ █▀█ █▀▄
config.enable_tab_bar = true
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
	max_width = 32,
	left_separator = ":",
	cwd_icon = " ",
	enabled_modules = {
		username = false,
		hostname = false,
		clock = false,
	},
})

return config
