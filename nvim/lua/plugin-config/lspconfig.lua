-- 共通オプション
local opts = { noremap = true, silent = true }

-- --------------------------------------------------------------
-- グローバルなキーマッピング
--
-- <space>e: 診断画面を開く
-- [d:       診断画面の前の項目に移動
-- ]d:       診断画面の次の項目に移動
-- <space>q: 画面の場所を変える？
--
-- --------------------------------------------------------------
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- on_attach: LSP起動時に上書きされる設定
local on_attach = function(client, bufnr)
    -- --------------------------------------------------------------
    -- グローバルなキーマッピング
    --
    -- K: カーソル下シンボルの情報を表示
    -- <C-k>: カーソル下シンボルのシグネチャ情報を表示
    -- gd: 定義にジャンプ
    -- gD: 宣言文にジャンプ
    -- gi: 実装にジャンプ
    -- gr: カーソル下シンボルのリファレンスを表示
    -- <space>wa: 指定したパスのフォルダをワークスペースフォルダに追加
    -- <space>wr: 指定したパスのフォルダをワークスペースフォルダから削除
    -- <space>wl: ワークスペースフォルダの一覧を表示
    -- <space>D: カーソル下シンボルの型定義を表示
    -- <space>rn: カーソル下シンボルの名称を変更
    -- <space>ca: カーソル下シンボルで実行できるカーソルアクションを選択
    -- <space>f: フォーマットを実行
    -- --------------------------------------------------------------
    -- 共通オプション
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- nvim-cmpが提供するcapabilityを追加
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSPサーバ読み込み
local lsp_servers = { "texlab", "rust_analyzer", "lua_ls", "bashls", "tsserver", "jdtls", "html", "cssls" }
for i, name in ipairs(lsp_servers) do
    require("lspconfig")[name].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end
