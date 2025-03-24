vim.g.mapleader = " " -- リーダをスペースに変更
vim.g.maplocalleader = "," -- ローカルリーダをカンマに変更
vim.g.loaded_netrw = 1 -- netrw（Vim純正ファイラ）を無効化
vim.g.loaded_netrwPlugin = 1 -- netrw（Vim純正ファイラ）を無効化

vim.o.number = true -- 行番号を表示
vim.o.tabstop = 2 -- タブをスペース2文字で表示
vim.o.shiftwidth = 2 -- インデントの見た目の空白数をスペース2文字で表示
vim.o.expandtab = true -- <Tab>を押したときにタブ文字ではなく半角スペースを挿入
vim.o.autoindent = true -- 改行したときにインデントを継承
vim.o.smartindent = true -- '{'で終わる行で改行すると勝手にインデント
vim.o.clipboard = "unnamedplus" -- クリップボード同期を有効化

vim.o.termguicolors = true -- GUIカラーを有効化
vim.o.background = "dark" -- 背景を明るく
