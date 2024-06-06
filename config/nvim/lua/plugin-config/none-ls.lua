local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.textlint.with({
			extra_filetypes = { "tex", "plaintex" },
			args = {
				"--config",
				"$XDG_CONFIG_HOME/textlint/.textlintrc.json",
				"--rules-base-directory",
				"$NVM_BIN/../lib/node_modules",
				"-f",
				"json",
				"--stdin",
				"--stdin-filename",
				"$FILENAME",
			},
		}),
	},
})
