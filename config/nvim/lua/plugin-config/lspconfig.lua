-- --------------------------------------------------------------
-- アイコン設定
-- --------------------------------------------------------------
local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- --------------------------------------------------------------
-- LSPサーバ読み込み
-- --------------------------------------------------------------

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_servers = require("util.lsp-servers").list

local lspconfig = require("lspconfig")
for _, name in ipairs(lsp_servers) do
	if name == "lua_ls" then
		require("neodev").setup()
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	else
		lspconfig[name].setup({ capabilities = capabilities })
	end
end

-- --------------------------------------------------------------
-- グローバルなキーマップ
--
-- <leader>e: エラー表示
-- [d: 前のエラーに移動
-- ]d: 次のエラーに移動
-- <leader>q: qucikfixリストを開く
-- --------------------------------------------------------------
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- --------------------------------------------------------------
-- バッファローカルなキーマップ
--
-- gD: 定義に移動
-- gd: 定義に移動
-- K: ホバー
-- gi: 実装に移動
-- <C-k>: シグネチャヘルプ
-- <leader>wa: ワークスペースフォルダを追加
-- <leader>wr: ワークスペースフォルダを削除
-- <leader>wl: ワークスペースフォルダをリスト
-- <leader>D: 型定義に移動
-- <leader>rn: 名前変更
-- <leader>ca: コードアクション
-- gr: 参照
-- <leader>f: フォーマット（formatter.nvimに移行）
-- --------------------------------------------------------------
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
	end,
})
