-- 新規タブでターミナルを開く
vim.keymap.set('n', '<leader>tt', ':terminal<CR>')

-- 垂直分割でターミナルを開く
vim.keymap.set('n', '<leader>tx', ':botright terminal<CR>')

-- <ESC>でターミナル挿入モードを終了
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
