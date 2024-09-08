return {
	{
		"lervag/vimtex",
		config = function()
			-- osがmacの場合のみ
			if vim.fn.has("mac") == 1 then
				vim.g.vimtex_view_method = "skim"
			elseif vim.fn.has("win32") == 1 then
				vim.g.vimtex_view_general_viewer = "/mnt/c/Users/ryg-wtnb/AppData/Local/SumatraPDF/SumatraPDF.exe"
				vim.g.vimtex_view_general_options = "--reuse-instance --forward-search @tex @line @pdf"
			elseif vim.fn.has("linux") == 1 then
				vim.g.vimtex_view_general_viewer = "zathura"
			end
		end,
	},
}
