return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            pickers = {
                find_files = {
                    -- ファイル検索で隠れファイルを表示する
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
        },
        keys = function()
            local builtin = require("telescope.builtin")
            return {
                { "<C-p>", builtin.find_files, desc = "Find files" },
                { "<C-g>", builtin.live_grep, desc = "Live grep" },
                { "<C-b>", builtin.buffers, desc = "Find buffers" },
                { "<C-t>", builtin.git_branches, desc = "Find git branches" },
            }
        end,
	}
}
