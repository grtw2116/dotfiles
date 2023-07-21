-- --------------------------------------------------------------
-- LSPサーバ読み込み
-- --------------------------------------------------------------

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_servers = require("util.lsp-servers").list

for _, name in ipairs(lsp_servers) do
    require("lspconfig")[name].setup { capabilities = capabilities }
end

-- --------------------------------------------------------------
-- 設定の大半をlspsaga.nvimに移行
--
-- <space>f: フォーマットを実行
-- --------------------------------------------------------------

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- tsserverとjsonlsのフォーマットを無効化
            if client.name == "tsserver" or client.name == "jsonls" then
                return false
            end
            return true
        end
    })
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', '<space>f', lsp_formatting, opts)
    end,
})
