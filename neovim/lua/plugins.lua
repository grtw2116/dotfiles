-- プラグイン設定
require('packer').startup(function(use)
    -- プラグインマネージャ
    use 'wbthomason/packer.nvim' -- Lua製プラグインマネージャ

    -- テキスト操作
    use 'tpope/vim-surround' -- 囲う処理がしやすくなる
    use 'tpope/vim-commentary' -- コメントアウト等の処理がしやすくなる

    -- ステータスバー
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }

    -- ファイラー
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    }

    -- Git
    use 'tpope/vim-fugitive' -- VimからGitを操作

    -- 文章
    use 'lervag/vimtex' -- Tex / LaTeX 向けプラグイン
    use 'dense-analysis/ale' -- 非同期の校正エンジン

    -- カラーテーマ
    use 'cocopon/iceberg.vim' -- Icebergテーマ

    -- LSP
    use 'neovim/nvim-lspconfig' -- Neovim公式のLSP設定
    use 'williamboman/mason.nvim' -- LSPサーバのパッケージマネージャ
    use 'williamboman/mason-lspconfig.nvim' -- neovim/nvim-lspconfigとmasonの橋渡し

    -- スニペット
    use 'hrsh7th/vim-vsnip' -- スニペット

    -- 自動補完
    use 'hrsh7th/nvim-cmp' -- 自動補完
    use 'hrsh7th/cmp-nvim-lsp' -- LSPから補完をフェッチ
    use 'hrsh7th/cmp-buffer' -- バッファから補完をフェッチ
    use 'hrsh7th/cmp-path' -- パスから補完をフェッチ
    use 'hrsh7th/cmp-cmdline' -- コマンドラインから補完をフェッチ
    use 'hrsh7th/cmp-vsnip' -- スニペットから補完をフェッチ

    -- 構文ハイライト
    use {
        'nvim-treesitter/nvim-treesitter', -- ツリーシッター
        run = ':TSUpdate'
    }

    -- ファジーファインダー
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- カラーコードを色付け
    use 'norcalli/nvim-colorizer.lua'
end)
-- vimtex設定
vim.g.vimtex_view_method = 'skim'

-- nvim-tree設定
vim.g.loaded_netrw = 1 -- netrw（Vim純正ファイラ）を無効化
vim.g.loaded_netrwPlugin = 1 -- netrw（Vim純正ファイラ）を無効化

vim.opt.termguicolors = true -- GUIカラーを有効化

vim.keymap.set( -- :NvimTreeToggleを<C-n>に割り当てる
    'n',
    '<C-n>',
    ':NvimTreeToggle<CR>'
)

require("nvim-tree").setup() -- デフォルト設定を読み込み

-- lualine設定
require('lualine').setup({
    options = {
        theme = 'iceberg' -- テーマをicebergに変更
    }
})

-- iceberg設定
vim.cmd 'colorscheme iceberg'

-- mason設定
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup()

-- LSP設定


-- 共通オプション
local opts = { noremap = true, silent = true }

-- <space>e: 診断画面を開く
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

-- [d: 診断画面の前の項目に移動
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

-- ]d: 診断画面の次の項目に移動
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- <space>q: 画面の場所を変える？
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- on_attach: LSP起動時に実行される
-- つまりLSP起動時のみ有効にしたい設定を記述する
local on_attach = function(client, bufnr)
    -- <C-x><C-o>で補完を開く
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- 共通オプション
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- K: カーソル下シンボルの情報を表示
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

    -- <C-k>: カーソル下シンボルのシグネチャ情報を表示
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    -- gd: 定義にジャンプ
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

    -- gD: 宣言文にジャンプ
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)

    -- gi: 実装にジャンプ
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

    -- gr: カーソル下シンボルのリファレンスを表示
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    -- <space>wa: 指定したパスのフォルダをワークスペースフォルダに追加
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)

    -- <space>wr: 指定したパスのフォルダをワークスペースフォルダから削除
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)

    -- <space>wl: ワークスペースフォルダの一覧を表示
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)

    -- <space>D: カーソル下シンボルの型定義を表示
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)

    -- <space>rn: カーソル下シンボルの名称を変更
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)

    -- <space>ca: カーソル下シンボルで実行できるカーソルアクションを選択
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)

    -- <space>f: フォーマットを実行
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- nvim-cmpが提供するcapabilityを追加
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSPサーバ読み込み
local lsp_servers = { "texlab", "rust_analyzer", "lua_ls", "bashls" }
for i, name in ipairs(lsp_servers) do
    require("lspconfig")[name].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- nvim-cmp設定
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
    })
})

-- treesitter設定
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,

        -- この設定を true にするとパーサ未インストールの言語だと代わりに vim 標準のハイライトが有効になる
        --
        -- 重複等が起きるため重くなる
        additional_vim_regex_highlighting = false
    },
}

-- telescope設定
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})           -- <leader>ff: ファイルを検索
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})            -- <leader>fg: 
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})              -- <leader>fb:
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})            -- <leader>fh:
