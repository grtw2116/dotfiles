return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)

			-- Mason経由でインストールされたLSPサーバーを自動セットアップ
			require("mason-lspconfig").setup_handlers({
				-- デフォルトのハンドラ
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end,
	},
}
