-- バッファ間の移動
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { noremap = true, silent = true })
