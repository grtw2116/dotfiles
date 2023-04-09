require("nvim-tree").setup()

-- :NvimTreeToggleを<C-n>に割り当てる
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
