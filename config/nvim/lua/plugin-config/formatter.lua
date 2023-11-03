-- キーマップ
vim.keymap.set("n", "<leader>f", ":Format<CR>", { silent = true })
vim.keymap.set("n", "<leader>F", ":FormatWrite<CR>", { silent = true })

-- フォーマット実行後にメッセージを表示
vim.api.nvim_create_autocmd("User", {
	pattern = "FormatterPost",
	callback = function()
		print("Formatted!")
	end,
})

require("formatter").setup({
	filetype = {
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},
		python = {
			-- pylspがautopep8を使っていたのでそれに合わせる
			require("formatter.filetypes.python").autopep8,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
	},
})
