local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {}) -- <C-p>: ファイル名から検索
vim.keymap.set("n", "<C-g>", builtin.live_grep, {}) -- <C-g>: ファイル内の文字列から検索
vim.keymap.set("n", "<C-b>", builtin.buffers, {}) -- <C-b>: バッファを検索
vim.keymap.set("n", "<C-t>", builtin.git_branches, {}) -- <C-b>: バッファを検索

require("telescope").setup({
	pickers = {
		find_files = {
			-- ファイル検索で隠れファイルを表示する
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
})
