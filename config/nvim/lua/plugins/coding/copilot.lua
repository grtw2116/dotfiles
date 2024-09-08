return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<M-;>",
					-- accept_word = true,
				},
			},
			filetypes = {
				tex = false,
			},
		},
	},
}
