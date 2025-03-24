return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				nil_ls = {},
				lua_ls = {},
				biome = {
					cmd = { "biome", "lsp-proxy" },
					on_new_config = function(new_config)
						-- pnpmが使われている場合は対応したコマンドをセット
						local pnpm = require("lspconfig").util.root_pattern("pnpm-lock.yml", "pnpm-lock.yaml")(
							vim.api.nvim_buf_get_name(0)
						)
						local cmd = { "npx", "biome", "lsp-proxy" }
						if pnpm then
							cmd = { "pnpm", "biome", "lsp-proxy" }
						end
						new_config.cmd = cmd
					end,
				},
			},
		},

		config = function(_, opts)
			-- アイコン設定
			local signs = {
				Error = "",
				Warn = "",
				Hint = "",
				Information = "",
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					-- vim.keymap.set('n', '<leader>f', function()
					--   vim.lsp.buf.format { async = true }
					-- end, opts)

					-- inlay hintsを有効化
					vim.lsp.inlay_hint.enable(true)
				end,
			})

			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
}
