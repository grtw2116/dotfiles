local sources = require("plugins.completion.cmp-sources")

return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = { sources },
		opts = function()
			local cmp = require("cmp")
			return {
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "nvim_lsp" }, -- LSP
					{ name = "nvim_lsp_signature_help" }, -- 関数のパラメータ
					{ name = "nvim_lsp_document_symbol" }, -- LSPのdocumentSymbol
					{ name = "buffer" }, -- バッファ内の単語
					{ name = "path" }, -- ファイルパス
					{ name = "nvim_lua" }, -- NeovimのLua API
					{ name = "lazydev" },
					{ name = "luasnip" }, -- スニペット
					{ name = "calc" }, -- 計算結果
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-l>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				formatting = {
					expandable_indicator = true,
					fields = { "abbr", "kind", "menu" },
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{ name = "cmdline" },
					}),
				}),
			}
		end,
	},
}