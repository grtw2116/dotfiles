return {
	{
		dir = "~/Developer/github.com/grtw2116/hover-translate.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			translator = {
				target_lang = "ja",
				provider = "google",
				api_key = os.getenv("GOOGLE_TRANSLATE_API_KEY"),
			},
			hover_window = {
				border = "rounded",
			},
		},
		keys = {
			{
				"gK",
				function()
					require("hover_translate").hover()
				end,
				desc = "LSP Hover (translated)",
			},
		},
	},
}
