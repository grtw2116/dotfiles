return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		cmd = { "CodeCompanionChat", "CodeCompanionActions" },
		opts = {
			strategies = {
				chat = {
					adapter = "anthropic",
				},
				inline = {
					adapter = "anthropic",
				},
			},
			opts = {
				language = "Japanese",
			},
		},
		keys = {
			{
				"<leader>at",
				"<cmd>CodeCompanionActions<cr>",
				{ "n", "v" },
				desc = "open codecompanion action palettes",
			},
			{
				"<leader>aa",
				"<cmd>CodeCompanionChat Toggle<cr>",
				{ "n", "v" },
				desc = "toggle codecompanion chat panel",
			},
			{
				"ga",
				"<cmd>CodeCompanionChat Add<cr>",
				{ "v" },
				desc = "Add selected text to current chat buffer",
			},
		},
	},
}
