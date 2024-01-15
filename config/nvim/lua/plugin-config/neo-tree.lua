vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent = true })
require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
		},
		group_empty_dirs = true,
	},
})
