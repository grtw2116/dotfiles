if vim.g.vscode then
	return
end

require("base") -- 基本設定
require("keymaps") -- キーマップ設定
require("terminal") -- ターミナル設定
require("plugin") -- プラグイン設定
