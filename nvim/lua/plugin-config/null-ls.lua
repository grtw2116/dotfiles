local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.textlint,
        null_ls.builtins.code_actions.gitsigns,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(client)
                            -- tsserverとjsonlsのフォーマットを無効化
                            if client.name == "tsserver" or client.name == "jsonls" then
                                return false
                            end
                            return true
                        end
                    })
                end
            })
        end
    end,
})

