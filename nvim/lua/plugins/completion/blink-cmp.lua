return {
	{
		"saghen/blink.cmp",
		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },
			sources = {
				default = { "lsp", "path", "buffer", "cmdline" },
				per_filetype = {
					codecompanion = { "codecompanion" },
				},
			},
			completion = {
				menu = { border = "single" },
				documentation = { window = { border = "single" } },
			},
			signature = { window = { border = "single" } },
		},
		opts_extend = { "sources.default" },
	},
}
