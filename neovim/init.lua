-- '~/.config/nvim/lua/*.lua'の読み込み
require("plugins")              -- プラグイン設定

-- 基本設定
vim.o.number = true             -- 行番号を表示
vim.o.tabstop = 4               -- タブをスペース4文字で表示
vim.o.shiftwidth = 4            -- インデントの見た目の空白数をスペース4文字で表示
vim.o.expandtab = true          -- <Tab>を押したときにタブ文字ではなく半角スペースを挿入
vim.o.autoindent = true         -- 改行したときにインデントを継承
vim.o.smartindent = true        -- '{'で終わる行で改行すると勝手にインデント
vim.o.clipboard = 'unnamed'     -- クリップボード同期
vim.g.maplocalleader = ","      -- ローカルリーダをカンマに変更
