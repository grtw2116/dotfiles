return {
	{
		dir = "~/Developer/github.com/grtw2116/hover-translate.nvim",
		opts = {
			target_lang = "ja",
			provider = "deepl",
			api_key = os.getenv("DEEPL_API_KEY"),
		},
		config = function(_, opts)
			require("hover_translate").setup(opts)
			vim.keymap.set("n", "gK", require("hover_translate").hover, { desc = "LSP Hover (translated)" })
		end,
	},
}
