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
					local capabilities = require("blink.cmp").get_lsp_capabilities()
					-- jdtlsはnvim-jdtlsを使うので、ここではセットアップしない
					if server_name ~= "jdtls" then
						require("lspconfig")[server_name].setup({
							config = {
								capabilities = capabilities,
							},
						})
					end
				end,
			})
		end,
	},
}
