vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
        }
    }
})
