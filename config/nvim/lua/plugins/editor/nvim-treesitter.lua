return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- リリース版は古すぎてWindowsでは動かないため
		build = ":TSUpdate",
		event = "VeryLazy",
		lazy = vim.fn.argc(-1) == 0, -- コマンドラインからファイルを開いた場合は遅延読み込みしない
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		opts = {
			ensure_installed = "all",
			sync_install = false,
			auto_install = false,
			ignore_install = {},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
