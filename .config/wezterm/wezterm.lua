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

config.font = wezterm.font_with_fallback({
    "PlemolJP Console NF"
})

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.font_size = 15.0
config.color_scheme = "Gruvbox Dark (Gogh)"

---------------------
-- 設定記述終了
---------------------

return config
