require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		keymap = {
			accept = "<M-;>",
		},
	},
	filetypes = {
		tex = false,
	},
})
