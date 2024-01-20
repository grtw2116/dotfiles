require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "autopep8" },
		-- Use a sub-list to run only the first available formatter
		javascript = { "rustywind", { "prettierd", "prettier" } },
		javascriptreact = { "rustywind", { "prettierd", "prettier" } },
		typescript = { "rustywind", { "prettierd", "prettier" } },
		typescriptreact = { "rustywind", { "prettierd", "prettier" } },
		sh = { "shfmt" },
		bash = { "shfmt" },
	},
	format_on_save = {
		-- timeout_ms = 500,
		lsp_fallback = true,
	},
})
