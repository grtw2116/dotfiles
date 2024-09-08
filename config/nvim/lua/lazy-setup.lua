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
	-- {
	-- 	"neanias/everforest-nvim",
	-- 	config = function()
	-- 		require("everforest").setup()
	-- 		vim.cmd("colorscheme everforest")
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		require("plugin-config/tokyonight")
	-- 	end,
	-- },

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("plugin-config/catppuccin")
		end,
	},

	-- --------------------------------------------------------------
	-- LSP
	-- --------------------------------------------------------------
	-- 自動補完
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugin-config/nvim-cmp")
		end,
	},

	-- 補完にアイコンを表示
	"onsails/lspkind-nvim",

	-- LSPから補完をフェッチ
	"hrsh7th/cmp-nvim-lsp",

	-- 関数入力時にその関数のシグネチャを表示
	"hrsh7th/cmp-nvim-lsp-signature-help",

	-- LSPからドキュメントシンボルをフェッチ
	"hrsh7th/cmp-nvim-lsp-document-symbol",

	-- Copilotから補完をフェッチ
	"hrsh7th/cmp-copilot",

	-- バッファから補完をフェッチ
	"hrsh7th/cmp-buffer",

	-- パスから補完をフェッチ
	"hrsh7th/cmp-path",

	-- コマンドラインから補完をフェッチ
	"hrsh7th/cmp-cmdline",

	-- スニペットから補完をフェッチ
	"saadparwaiz1/cmp_luasnip",

	-- NeovimのLua APIから補完をフェッチ
	"hrsh7th/cmp-nvim-lua",

	-- 計算から補完をフェッチ
	"hrsh7th/cmp-calc",

	-- luaのneovim APIを補完
	{
		"folke/lazydev.nvim",
		ft = "lua",
	},

	-- ポータブルLSPインストーラ
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugin-config/mason")
		end,
	},

	-- Masonとlspconfigの橋渡し
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugin-config/mason-lspconfig")
		end,
	},

	-- Neovim公式のLSP設定
	{
		"neovim/nvim-lspconfig",
		dependencies = { "folke/neodev.nvim" },
		config = function()
			require("plugin-config/lspconfig")
		end,
	},

	-- LSPのUIを提供
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugin-config/trouble")
		end,
	},

	-- ホバーを綺麗に表示
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {},
	},

	-- --------------------------------------------------------------
	-- デバッガ
	-- --------------------------------------------------------------
	{
		"mfussenegger/nvim-dap",
	},

	-- --------------------------------------------------------------
	-- フォーマッタ
	-- --------------------------------------------------------------
	-- {
	-- 	"mhartington/formatter.nvim",
	-- 	config = function()
	-- 		require("plugin-config/formatter")
	-- 	end,
	-- },
	{
		"stevearc/conform.nvim",
		config = function()
			require("plugin-config/conform")
		end,
	},

	-- --------------------------------------------------------------
	-- ファジーファインダー
	-- --------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin-config/telescope")
		end,
	},

	-- --------------------------------------------------------------
	-- TreeSitter
	-- --------------------------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
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
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin-config/lualine")
		end,
	},

	-- バッファライン
	{
		"akinsho/bufferline.nvim",
		after = "catppuccin",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin-config/nvim-bufferline")
		end,
	},

	-- winbar
	{
		"Bekaboo/dropbar.nvim",
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
	},

	-- ハイライト
	"RRethy/vim-illuminate",

	-- カラーコードを色付け
	{
		"norcalli/nvim-colorizer.lua",
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
		"stevearc/aerial.nvim",
		config = function()
			require("plugin-config/aerial")
		end,
	},

	-- ファンシーな選択・入力UI
	"stevearc/dressing.nvim",

	-- ファンシーな通知UI
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-config/noice")
		end,
		tag = "v4.4.7",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- --------------------------------------------------------------
	-- 移動系
	-- --------------------------------------------------------------
	-- 移動支援
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
		    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash"   },
		    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},

	-- --------------------------------------------------------------
	-- テキスト操作
	-- --------------------------------------------------------------
	-- 囲う処理がしやすくなる
	"tpope/vim-surround",

	-- コンテキストに応じてコメントアウトの方法を変える
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},

	-- コメントアウト
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	-- コメント整形
	"godlygeek/tabular",

	-- --------------------------------------------------------------
	-- ファイル操作系
	-- --------------------------------------------------------------
	-- ファイラー
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("plugin-config/neo-tree")
	-- 	end,
	-- },

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugin-config/nvim-tree")
		end,
		keys = {
			{
				"<C-n>",
				"<cmd>NvimTreeToggle<CR>",
				mode = "n",
				desc = "Toggle NvimTree",
			},
		},
	},

	-- --------------------------------------------------------------
	-- 標準機能拡張系
	-- --------------------------------------------------------------
	-- ターミナル
	{
		"akinsho/nvim-toggleterm.lua",
		version = "*",
		config = true,
	},

	-- --------------------------------------------------------------
	-- コーディング関連
	-- --------------------------------------------------------------
	-- 括弧を自動で閉じる
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugin-config/nvim-autopairs")
		end,
	},

	-- htmlのタグを自動で閉じる
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("plugin-config/nvim-ts-autotag")
		end,
	},

	-- Gitクライアント
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		config = function()
			require("plugin-config/neogit")
		end,
	},

	-- Gitの差分を見やすく
	"sindrets/diffview.nvim",

	-- Gitの状態を見やすく
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugin-config/gitsigns")
		end,
	},

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("plugin-config/copilot")
		end,
	},

	-- GitHub Copilot Chat
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		config = function()
			require("plugin-config/copilot-chat")
		end,
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
	},

	-- インデント幅を自動検知
	"tpope/vim-sleuth",

	-- TypeScriptのエラーを読みやすく
	"dmmulroy/ts-error-translator.nvim",

	-- --------------------------------------------------------------
	-- リーディング支援
	-- --------------------------------------------------------------
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("plugin-config/indent-blankline")
		end,
	},

	-- "TODO"などに色付け
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	-- --------------------------------------------------------------
	-- 言語固有プラグイン
	-- --------------------------------------------------------------
	-- LaTeX
	{
		"lervag/vimtex",
		config = function()
			require("plugin-config/vimtex")
		end,
	},

	-- TypeScript / JavaScript
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		config = function()
			require("plugin-config/typescript-tools")
		end,
	},

	-- Java
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},

	-- Markdown
	-- {
	-- 	"MeanderingProgrammer/markdown.nvim",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	config = function()
	-- 		require("render-markdown").setup({})
	-- 	end,
	-- },

	-- PlantUML
	-- {
	-- 	"https://gitlab.com/itaranto/plantuml.nvim",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("plantuml").setup({
	-- 			renderer = {
	-- 				type = "image",
	-- 			},
	-- 		})
	-- 	end,
	-- },

	-- {
	-- 	"nvim-java/nvim-java",
	-- 	dependencies = {
	-- 		"nvim-java/lua-async-await",
	-- 		"nvim-java/nvim-java-core",
	-- 		"nvim-java/nvim-java-test",
	-- 		"nvim-java/nvim-java-dap",
	-- 		"MunifTanjim/nui.nvim",
	-- 		"neovim/nvim-lspconfig",
	-- 		"mfussenegger/nvim-dap",
	-- 		{
	-- 			"williamboman/mason.nvim",
	-- 			opts = {
	-- 				registries = {
	-- 					"github:nvim-java/mason-registry",
	-- 					"github:mason-org/mason-registry",
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		require("java").setup()
	-- 	end,
	-- },

	-- --------------------------------------------------------------
	-- スニペット
	-- --------------------------------------------------------------
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			require("plugin-config/luasnip")
		end,
	},

	-- --------------------------------------------------------------
	-- その他
	-- --------------------------------------------------------------
	-- キーバインドを表示
	{
		"folke/which-key.nvim",
		config = function()
			require("plugin-config/which-key")
		end,
	},

	{
		"f-person/auto-dark-mode.nvim",
		config = function()
			require("plugin-config/auto-dark-mode")
		end,
	},

	{
		"startup-nvim/startup.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("startup").setup()
		end,
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
})
