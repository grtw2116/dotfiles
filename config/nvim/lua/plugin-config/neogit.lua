require("neogit").setup{
    integrations = {
        diffview = true
    }
}

vim.keymap.set('n', '<leader>ng', ':Neogit<CR>')
