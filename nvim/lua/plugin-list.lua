require('packer').startup(function(use)
    -- --------------------------------------------------------------
    -- パッケージマネージャ
    -- --------------------------------------------------------------
    use {
        'wbthomason/packer.nvim',
        config = function()
            require("plugin-config/packer")
        end,
    }

    -- --------------------------------------------------------------
    -- ColorScheme
    -- --------------------------------------------------------------
    use {
        'EdenEast/nightfox.nvim',
        config = function()
            require("plugin-config/nightfox")
        end,
    }

    -- --------------------------------------------------------------
    -- LSP
    -- --------------------------------------------------------------
    -- 自動補完
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require("plugin-config/nvim-cmp")
        end,
    }

    -- 補完にアイコンを表示
    use 'onsails/lspkind-nvim'

    -- LSPから補完をフェッチ
    use 'hrsh7th/cmp-nvim-lsp'

    -- 関数入力時にその関数のシグネチャを表示
    use 'hrsh7th/cmp-nvim-lsp-signature-help'

    -- LSPからドキュメントシンボルをフェッチ
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'

    -- Copilotから補完をフェッチ
    use 'hrsh7th/cmp-copilot'

    -- バッファから補完をフェッチ
    use 'hrsh7th/cmp-buffer'

    -- パスから補完をフェッチ
    use 'hrsh7th/cmp-path'

    -- コマンドラインから補完をフェッチ
    use 'hrsh7th/cmp-cmdline'

    -- スニペットから補完をフェッチ
    use 'saadparwaiz1/cmp_luasnip'

    -- NeovimのLua APIから補完をフェッチ
    use 'hrsh7th/cmp-nvim-lua'

    -- 計算から補完をフェッチ
    use 'hrsh7th/cmp-calc'

    -- ポータブルLSPインストーラ
    use {
        'williamboman/mason.nvim',
        run = ':MasonUpdate',
        config = function()
            require("plugin-config/mason")
        end,
    }

    -- Masonとlsp-configの橋渡し
    use {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("plugin-config/mason-lspconfig")
        end,
        after = "mason.nvim",
    }

    -- Neovim公式のLSP設定
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require("plugin-config/lspconfig")
        end,
        after = {
            "mason.nvim",
            "mason-lspconfig.nvim",
        }
    }

    -- 疑似LSP
    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require("plugin-config/null-ls")
        end
    }

    -- LSPの起動状況を表示
    -- 現在開発者によってリライトされているため，破壊的変更を防ぐためにlegacyタグを指定
    use {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        config = function()
            require("fidget").setup()
        end,
    }

    -- --------------------------------------------------------------
    -- ファジーファインダー
    -- --------------------------------------------------------------
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require("plugin-config/telescope")
        end
    }

    -- --------------------------------------------------------------
    -- TreeSitter
    -- --------------------------------------------------------------
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require("plugin-config/nvim-treesitter")
        end,
    }

    -- --------------------------------------------------------------
    -- 見た目関連
    -- --------------------------------------------------------------
    -- ステータスライン
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require("plugin-config/lualine")
        end
    }

    -- カラーコードを色付け
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("plugin-config/nvim-colorizer")
        end,
    }

    -- --------------------------------------------------------------
    -- 移動系
    -- --------------------------------------------------------------
    -- 今いる行の f で一発で飛べる単語をハイライト
    use 'unblevable/quick-scope'

    -- 移動支援
    use 'folke/flash.nvim'

    -- --------------------------------------------------------------
    -- テキスト操作
    -- --------------------------------------------------------------
    -- 囲う処理がしやすくなる
    use 'tpope/vim-surround'

    -- コメントアウト
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- --------------------------------------------------------------
    -- ファイル操作系
    -- --------------------------------------------------------------
    -- ファイラー
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require("plugin-config/nvim-tree")
        end
    }

    -- --------------------------------------------------------------
    -- コーディング関連
    -- --------------------------------------------------------------
    -- 括弧を自動で閉じる
    use {
        'windwp/nvim-autopairs',
        config = function()
            require("plugin-config/nvim-autopairs")
        end,
    }

    -- htmlのタグを自動で閉じる
    use {
        'windwp/nvim-ts-autotag',
        config = function()
            require("plugin-config/nvim-ts-autotag")
        end,
    }

    -- Gitクライアント
    use {
        'NeogitOrg/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("plugin-config/neogit")
        end
    }

    -- Gitの差分を見やすく
    use 'sindrets/diffview.nvim'

    -- Gitの状態を見やすく
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("plugin-config/gitsigns")
        end
    }

    -- Copilot
    use {
        'github/copilot.vim',
        config = function()
            require("plugin-config/copilot")
        end
    }

    -- インデント幅を自動検知
    use 'tpope/vim-sleuth'

    -- --------------------------------------------------------------
    -- リーディング支援
    -- --------------------------------------------------------------
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("plugin-config/indent-blankline")
        end,
    }

    -- --------------------------------------------------------------
    -- 言語固有プラグイン
    -- --------------------------------------------------------------
    -- LaTeX
    use {
        'lervag/vimtex',
        config = function()
            require("plugin-config/vimtex")
        end,
    }

    -- --------------------------------------------------------------
    -- スニペット
    -- --------------------------------------------------------------
    -- スニペット
    use {
        'L3MON4D3/LuaSnip',
        config = function()
            require("plugin-config/luasnip")
        end,
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
    }

    -- スニペット定義
    use "rafamadriz/friendly-snippets"

    -- --------------------------------------------------------------
    -- その他
    -- --------------------------------------------------------------
    -- キーバインドを表示
    use {
        'folke/which-key.nvim',
        config = function()
            require("plugin-config/which-key")
        end,
    }

    -- ssh先でのクリップボードを同期（OSC52を使用）
    use {
        'ojroques/nvim-osc52',
        config = function()
            require("plugin-config.nvim-osc52")
        end,
    }

    -- Obsidian との連携
    use {
        'epwalsh/obsidian.nvim',
        config = function()
            require("plugin-config/obsidian-nvim")
        end,
    }
end)
