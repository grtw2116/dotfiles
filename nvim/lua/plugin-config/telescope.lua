local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})     -- <C-p>: ファイル名から検索
vim.keymap.set("n", "<C-g>", builtin.live_grep, {})       -- <C-g>: ファイル内の文字列から検索
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})   -- <leader>fb:
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {}) -- <leader>fh:
