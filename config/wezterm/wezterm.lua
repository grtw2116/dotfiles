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
config.color_scheme = "tokyonight"

-- <C-q>: Leaderキー
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 2000 }

local act = wezterm.action
config.keys = {
    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection 'Left' },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection 'Down' },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection 'Up' },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection 'Right' },
    { key = "-", mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { key = "|", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } }
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
