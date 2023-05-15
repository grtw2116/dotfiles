-- osがmacの場合のみ
if vim.fn.has("mac") == 1 then
    vim.g.vimtex_view_method = 'skim'
else
    vim.g.vimtex_view_general_viewer = "/mnt/c/Users/ryg-wtnb/AppData/Local/SumatraPDF/SumatraPDF.exe"
    vim.g.vimtex_view_general_options = "--reuse-instance --forward-search @tex @line @pdf"
end
