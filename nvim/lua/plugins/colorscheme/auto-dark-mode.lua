return {
	{
		"f-person/auto-dark-mode.nvim",
		lazy = false,
		dependencies = { "catppuccin/nvim" },
		opts = {
			update_interval = 1000,
			set_dark_mode = function()
				vim.o.background = "dark"
				vim.cmd("colorscheme catppuccin")
			end,
			set_light_mode = function()
				vim.o.background = "light"
				vim.cmd("colorscheme catppuccin")
			end,
		},
	},
}
