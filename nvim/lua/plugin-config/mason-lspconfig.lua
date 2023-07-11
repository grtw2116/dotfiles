local lsp_servers = require("util.lsp-servers").list
require("mason-lspconfig").setup({
    ensure_installed = lsp_servers
})
