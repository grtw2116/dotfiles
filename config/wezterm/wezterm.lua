-- wezterm APIからpull
local wezterm = require("wezterm")

-- このテーブルに設定項目を追加していく
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

---------------------
-- 設定記述開始
---------------------

function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

config.window_frame = {
	font = wezterm.font({ family = "Moralerspace Argon NF", weight = "Bold" }),
	font_size = 12.0,
	active_titlebar_bg = "#292e42",
	inactive_titlebar_bg = "#292e42",
}

config.native_macos_fullscreen_mode = true

-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.use_fancy_tab_bar = false

config.color_scheme = scheme_for_appearance(get_appearance())

config.font = wezterm.font_with_fallback({
	"Moralerspace Argon NF",
	"PlemolJP Console NF",
})

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_background_opacity = 0.9
config.macos_window_background_blur = 100

config.font_size = 12.0

-- <C-q>: Leaderキー
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 2000 }

local act = wezterm.action
config.keys = {
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "x",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- <C-l>: ランチャー表示
	{ key = "l", mods = "CMD", action = act.ShowLauncher },
	-- Windows / Linux環境では AltキーをSuperキーとして使う
	{ key = "Alt", action = act.SendKey({ key = "Super" }) },
}

-- ssh設定
-- .ssh/configに設定したホスト名を指定する
-- `wezterm connect SSH:ホスト名` で接続
-- `wezterm connect SSHMUX:ホスト名` で多重化対応接続
config.ssh_domains = wezterm.default_ssh_domains()

---------------------
-- 設定記述終了
---------------------

return config
