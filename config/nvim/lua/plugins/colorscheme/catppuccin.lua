return {
	-- catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin", -- lazy.nvimにおける名称
		lazy = false,
		priority = 1000,
		opts = {
			integrations = {
				flash = true,
				aerial = true,
				diffview = true,
				dropbar = {
					enabled = true,
				},
				noice = true,
				notify = true,
			},
			transparent_background = true,
		},
	},
}
