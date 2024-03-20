require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		keymap = {
			open = "<leader>c",
		},
	},
	filetypes = {
		tex = false,
	},
})
