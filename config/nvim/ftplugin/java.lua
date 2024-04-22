local jdtls = require("jdtls")

-- LSPを起動
jdtls.start_or_attach({
	cmd = { os.getenv("XDG_DATA_HOME") .. "/nvim/mason/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
})
