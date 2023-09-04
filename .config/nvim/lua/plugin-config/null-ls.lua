local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with {
            -- root_dirに.prettierrcがあるかどうかで有効化するか判断
            condition = function(utils)
                return utils.root_has_file { ".prettierrc", ".prettierrc.js" }
            end
        },
        null_ls.builtins.diagnostics.textlint,
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
