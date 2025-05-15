return {
	{
		"grtw2116/hover_translate.nvim",
		opts = {
			target_lang = "ja",
			provider = "google",
			api_key = os.getenv("TRANSLATE_API_KEY"),
		},
		config = function()
			vim.keymap.set("n", "K", require("hover_translate").hover, { desc = "LSP Hover (translated)" })
		end,
	},
}
