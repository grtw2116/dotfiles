-- 新規タブでターミナルを開く
vim.keymap.set('n', '<leader>tt', ':terminal<CR>')

-- 垂直分割でターミナルを開く
vim.keymap.set('n', '<leader>tx', ':bo :terminal<CR>', { noremap = true, silent = true })

-- <ESC>でターミナル挿入モードを終了
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

-- 常にインサートモードで開く

