require("lspsaga").setup({
    lightbulb = {
        virtual_text = false,
    },
    code_action = {
        show_server_name = true,
        extend_gitsigns = true,
    },
})

-- -----------------------------------------------
-- キーマップ
--
-- K: ホバーを表示する
-- [e: 前の診断にジャンプする
-- ]e: 次の診断にジャンプする
-- [E: 前のエラーにジャンプする
-- ]E: 次のエラーにジャンプする
-- gh: シンボルの定義を検索する．定義がない場合は非表示になる．<C-t>で戻る
-- gr: ファイル内のホバーした単語のすべての出現をリネームする
-- gp: 定義をプレビューする
-- gd: 定義へジャンプする
-- gt: 型定義をプレビューする
-- <leader>ca: コードアクション
-- <leader>sl: 行の診断を表示する
-- <leader>sb: バッファの診断を表示する
-- <leader>sw: ワークスペースの診断を表示する
-- <leader>sc: カーソルの診断を表示する
-- <leader>o: アウトラインを表示する
-- <Leader>ci: 呼び出し階層を表示する
-- <Leader>co: 呼び出し階層を表示する
-- <A-d>: ターミナルを表示する
-- -----------------------------------------------


local keymap = vim.keymap.set
keymap("n", "gh", "<cmd>Lspsaga finder<CR>")
keymap("n", "gr", "<cmd>Lspsaga lsp_rename ++project<CR>")
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

keymap("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
keymap({ "n", "t" }, "<Leader>d", "<cmd>Lspsaga term_toggle<CR>")
