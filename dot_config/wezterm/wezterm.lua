-- Configure the 'wezterm' terminal emulator
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
config.font_size = 18

config.color_scheme = "rose-pine"

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.45

if get_os_name() == "macos" then
	config.macos_window_background_blur = 20
end

config.enable_tab_bar = true
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
	separator = {
		space = 1,
		left_icon = ":",
		right_icon = "",
		field_icon = wezterm.nerdfonts.indent_line,
	},
	modules = {
		pane = { enabled = false },
		workspace = { enabled = false },
		hostname = { enabled = false },
		clock = { enabled = false },
	},
})

return config
