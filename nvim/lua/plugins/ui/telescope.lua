return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			pickers = {
				find_files = {
					-- ファイル検索で隠れファイルを表示する
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		},
		keys = function()
			local builtin = require("telescope.builtin")
			return {
				{ "<leader>ff", builtin.find_files, desc = "Find files" },
				{ "<leader>fg", builtin.live_grep, desc = "Live grep" },
				{ "<leader>fb", builtin.buffers, desc = "Find buffers" },
				{ "<leader>fi", builtin.git_branches, desc = "Find git branches" },
				{ "<leader>fl", builtin.lsp_references, desc = "LSP references" },
			}
		end,
	},
}
