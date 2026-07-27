--    ____  _           _ _               
--   |  _ \(_)_ __   __| | |_   _ _ __ ___  _ __   ___ 
--   | |_) | | '_ \ / _` | | | | | '_ ` _ \| '_ \ / _ \
--   |  __/| | | | | (_| | | |_| | | | | | | |_) | (_) |
--   |_|   |_|_| |_|\__,_|_|\__,_|_| |_| |_| .__/ \___/ 
--                                          |_|          

local colors = {
	bg = "0a0e17",
	fg = "e0e4ec",
	accent = "1e90ff",
	warm = "ff8c00",
	purple = "7b68ee",
	muted = "3a3f4b",
}

local activeBorderColor = {
	colors = {
		"rgba(" .. colors.accent .. "ee)",
		"rgba(" .. colors.warm .. "f2)",
		"rgba(" .. colors.purple .. "d6)",
	},
	angle = 135,
}

local inactiveBorderColor = "rgba(" .. colors.muted .. "a8)"
local groupInactiveBorderColor = "rgba(" .. colors.muted .. "82)"
local activeShadowColor = "rgba(" .. colors.accent .. "42)"
local inactiveShadowColor = "rgba(" .. colors.bg .. "24)"

hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 14,
		border_size = 2,
		col = {
			active_border = activeBorderColor,
			inactive_border = inactiveBorderColor,
		},
	},

	group = {
		col = {
			border_active = activeBorderColor,
			border_inactive = groupInactiveBorderColor,
		},
		groupbar = {
			enabled = true,
			blur = true,
			gradients = true,
			stacked = false,
			height = 24,
			gaps_in = 4,
			gaps_out = 0,
			indicator_height = 2,
			indicator_gap = 4,
			font_family = "monospace",
			font_size = 11,
			font_weight_active = "bold",
			font_weight_inactive = "normal",
			text_color = "rgb(" .. colors.fg .. ")",
			text_color_inactive = "rgba(" .. colors.fg .. "aa)",
			col = {
				active = {
					colors = {
						"rgba(" .. colors.bg .. "ec)",
						"rgba(" .. colors.accent .. "40)",
					},
					angle = 135,
				},
				inactive = "rgba(" .. colors.bg .. "b8)",
				locked_active = "rgba(" .. colors.purple .. "45)",
				locked_inactive = "rgba(" .. colors.muted .. "55)",
			},
			gradient_rounding = 8,
			gradient_rounding_power = 2,
		},
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,
		inactive_opacity = 0.95,
		fullscreen_opacity = 1.0,
		dim_inactive = true,
		dim_strength = 0.06,
		dim_special = 0.12,

		blur = {
			enabled = true,
			size = 6,
			passes = 4,
			special = true,
			popups = true,
			input_methods = true,
			ignore_opacity = true,
			new_optimizations = true,
			xray = false,
			noise = 0.02,
			contrast = 0.92,
			brightness = 0.85,
			vibrancy = 0.06,
			vibrancy_darkness = 0.3,
			popups_ignorealpha = 0.55,
			input_methods_ignorealpha = 0.55,
		},

		shadow = {
			enabled = true,
			range = 24,
			render_power = 3,
			offset = "2 4",
			color = activeShadowColor,
			color_inactive = inactiveShadowColor,
		},
	},

	animations = {
		enabled = true,
	},
})

hl.curve("dispatchSnap", { type = "bezier", points = { { 0.16, 0.90 }, { 0.20, 1.0 } } })
hl.curve("dispatchFloat", { type = "bezier", points = { { 0.22, 0.80 }, { 0.18, 1.0 } } })
hl.curve("dispatchFade", { type = "bezier", points = { { 0.36, 0.0 }, { 0.12, 1.0 } } })
hl.curve("dispatchSlide", { type = "bezier", points = { { 0.18, 0.94 }, { 0.28, 1.0 } } })

hl.animation({ leaf = "global", enabled = true, speed = 8, bezier = "dispatchSnap" })
hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "dispatchFloat" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "dispatchSnap", style = "popin 12%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "dispatchFade", style = "popin 82%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "dispatchFloat" })
hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "dispatchFade" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 10, bezier = "linear", style = "once" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "dispatchFade" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 4, bezier = "dispatchFade" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 3, bezier = "dispatchFade" })
hl.animation({ leaf = "layers", enabled = true, speed = 5, bezier = "dispatchSlide", style = "slidefade" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 5, bezier = "dispatchSnap", style = "slidefade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 4, bezier = "dispatchFade", style = "fade" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "dispatchSlide", style = "slidefade" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4, bezier = "dispatchSlide", style = "slidevert" })

hl.window_rule({
	name = "dispatch-floating-polish",
	rounding = 12,
	border_size = 2,
	opacity = "0.97 0.93",
	match = {
		float = true,
	},
})
