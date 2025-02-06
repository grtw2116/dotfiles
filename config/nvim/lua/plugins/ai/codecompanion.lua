return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			strategies = {
				chat = {
					adapter = "openai",
				},
				inline = {
					adapter = "openai",
				},
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
		},
	},
}
