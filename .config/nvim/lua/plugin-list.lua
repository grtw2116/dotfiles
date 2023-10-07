require("lazy").setup({
    -- --------------------------------------------------------------
    -- ColorScheme
    -- --------------------------------------------------------------
    --  {
    --     'EdenEast/nightfox.nvim',
    --     config = function()
    --         require("plugin-config/nightfox")
    --     end,
    -- },
    {
        "neanias/everforest-nvim",
        config = function()
            require("everforest").setup()
            vim.cmd("colorscheme everforest")
        end,
    },

    -- --------------------------------------------------------------
    -- LSP
    -- --------------------------------------------------------------
    -- 自動補完
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require("plugin-config/nvim-cmp")
        end,
    },

    -- 補完にアイコンを表示
    'onsails/lspkind-nvim',

    -- LSPから補完をフェッチ
    'hrsh7th/cmp-nvim-lsp',

    -- 関数入力時にその関数のシグネチャを表示
    'hrsh7th/cmp-nvim-lsp-signature-help',

    -- LSPからドキュメントシンボルをフェッチ
    'hrsh7th/cmp-nvim-lsp-document-symbol',

    -- Copilotから補完をフェッチ
    'hrsh7th/cmp-copilot',

    -- バッファから補完をフェッチ
    'hrsh7th/cmp-buffer',

    -- パスから補完をフェッチ
    'hrsh7th/cmp-path',

    -- コマンドラインから補完をフェッチ
    'hrsh7th/cmp-cmdline',

    -- スニペットから補完をフェッチ
    'saadparwaiz1/cmp_luasnip',

    -- NeovimのLua APIから補完をフェッチ
    'hrsh7th/cmp-nvim-lua',

    -- 計算から補完をフェッチ
    'hrsh7th/cmp-calc',

    -- ポータブルLSPインストーラ
    {
        'williamboman/mason.nvim',
        run = ':MasonUpdate',
        config = function()
            require("plugin-config/mason")
        end,
    },

    -- Masonとlsp-configの橋渡し
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("plugin-config/mason-lspconfig")
        end,
        after = "mason.nvim",
    },

    -- Neovim公式のLSP設定
    {
        'neovim/nvim-lspconfig',
        config = function()
            require("plugin-config/lspconfig")
        end,
        after = {
            "mason.nvim",
            "mason-lspconfig.nvim",
        },
    },

    -- 疑似LSP
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require("plugin-config/null-ls")
        end
    },

    -- LSPの起動状況を表示
    -- 現在開発者によってリライトされているため，破壊的変更を防ぐためにlegacyタグを指定
    {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        config = function()
            require("fidget").setup()
        end,
    },

    -- --------------------------------------------------------------
    -- ファジーファインダー
    -- --------------------------------------------------------------
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("plugin-config/telescope")
        end
    },

    -- --------------------------------------------------------------
    -- TreeSitter
    -- --------------------------------------------------------------
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            require("plugin-config/nvim-treesitter")
        end,
    },

    -- --------------------------------------------------------------
    -- 見た目関連
    -- --------------------------------------------------------------
    -- ステータスライン
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("plugin-config/lualine")
        end
    },

    -- バッファライン
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("bufferline").setup()
        end
    },

    -- winbar
    {
        'fgheng/winbar.nvim',
    },

    -- ハイライト
    'RRethy/vim-illuminate',

    -- カラーコードを色付け
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("plugin-config/nvim-colorizer")
        end,
    },

    -- スクロールバー
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup()
        end,
    },

    -- アウトライン
    {
        'stevearc/aerial.nvim',
        config = function()
            require("plugin-config/aerial")
        end,
    },

    -- --------------------------------------------------------------
    -- 移動系
    -- --------------------------------------------------------------
    -- 移動支援
    'folke/flash.nvim',

    -- --------------------------------------------------------------
    -- テキスト操作
    -- --------------------------------------------------------------
    -- 囲う処理がしやすくなる
    'tpope/vim-surround',

    -- コメントアウト
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- --------------------------------------------------------------
    -- ファイル操作系
    -- --------------------------------------------------------------
    -- ファイラー
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- --------------------------------------------------------------
    -- コーディング関連
    -- --------------------------------------------------------------
    -- 括弧を自動で閉じる
    {
        'windwp/nvim-autopairs',
        config = function()
            require("plugin-config/nvim-autopairs")
        end,
    },

    -- htmlのタグを自動で閉じる
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require("plugin-config/nvim-ts-autotag")
        end,
    },

    -- Gitクライアント
    {
        'NeogitOrg/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("plugin-config/neogit")
        end
    },

    -- Gitの差分を見やすく
    'sindrets/diffview.nvim',

    -- Gitの状態を見やすく
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("plugin-config/gitsigns")
        end
    },

    -- Copilot
    {
        'github/copilot.vim',
        config = function()
            require("plugin-config/copilot")
        end
    },

    -- インデント幅を自動検知
    'tpope/vim-sleuth',

    -- --------------------------------------------------------------
    -- リーディング支援
    -- --------------------------------------------------------------
    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        opts = {},
        config = function()
            require("plugin-config/indent-blankline")
        end,
    },

    -- --------------------------------------------------------------
    -- 言語固有プラグイン
    -- --------------------------------------------------------------
    -- LaTeX
    {
        'lervag/vimtex',
        config = function()
            require("plugin-config/vimtex")
        end,
    },

    -- --------------------------------------------------------------
    -- スニペット
    -- --------------------------------------------------------------

    -- --------------------------------------------------------------
    -- その他
    -- --------------------------------------------------------------
    -- キーバインドを表示
    {
        'folke/which-key.nvim',
        config = function()
            require("plugin-config/which-key")
        end,
    },

    -- ssh先でのクリップボードを同期（OSC52を使用）
    {
        'ojroques/nvim-osc52',
        config = function()
            require("plugin-config.nvim-osc52")
        end,
    },

    -- Obsidian との連携
    {
        'epwalsh/obsidian.nvim',
        config = function()
            require("plugin-config/obsidian-nvim")
        end,
    },
})
