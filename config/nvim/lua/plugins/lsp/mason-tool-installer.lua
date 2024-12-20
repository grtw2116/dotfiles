return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = "williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"texlab",
				"rust_analyzer",
				"bashls",
				"pyright",
				"dockerls",
				"docker_compose_language_service",
				"gradle_ls",

				-- Lua
				"lua_ls",
				"stylua",

				-- Web
				"tailwindcss",
				"jsonls",
				"html",
				"cssls",
			},
		},
	},
}
