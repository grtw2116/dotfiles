require('packer').startup(function(use)
    -- --------------------------------------------------------------
    -- パッケージマネージャ
    -- --------------------------------------------------------------
    use 'wbthomason/packer.nvim'

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

    -- LSPから補完をフェッチ
    use 'hrsh7th/cmp-nvim-lsp'

    -- 関数入力時にその関数のシグネチャを表示
    use 'hrsh7th/cmp-nvim-lsp-signature-help'

    -- バッファから補完をフェッチ
    use 'hrsh7th/cmp-buffer'

    -- パスから補完をフェッチ
    use 'hrsh7th/cmp-path'

    -- コマンドラインから補完をフェッチ
    use 'hrsh7th/cmp-cmdline'

    -- スニペットから補完をフェッチ
    use 'hrsh7th/cmp-vsnip'

    -- NeovimのLua APIから補完をフェッチ
    use 'hrsh7th/cmp-nvim-lua'

    -- Neovim公式のLSP設定
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require("plugin-config/lspconfig")
        end,
    }

    -- ポータブルLSPインストーラ
    use {
        'williamboman/mason.nvim',
        config = function()
            require("plugin-config/mason")
        end,
    }

    -- Masonとlsp-configの橋渡し
    use {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("plugin-config/mason-lspconfig")
        end
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
        run = ':TSUpdate'
    }

    -- --------------------------------------------------------------
    -- 見た目関連
    -- --------------------------------------------------------------
    -- ステータスライン
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons'
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

    -- --------------------------------------------------------------
    -- テキスト操作
    -- --------------------------------------------------------------
    -- 囲う処理がしやすくなる
    use 'tpope/vim-surround'

    -- コメントアウト
    use 'tpope/vim-commentary'

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
    use 'windwp/nvim-autopairs'

    -- htmlのタグを自動で閉じる
    use 'windwp/nvim-ts-autotag'

    -- Gitクライアント
    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("plugin-config/neogit")
        end
    }

    -- Copilot
    use 'github/copilot.vim'

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
    use 'hrsh7th/vim-vsnip'
end)