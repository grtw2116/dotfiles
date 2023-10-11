require("formatter").setup({
    filetype = {
        typescriptreact = {
            require("formatter.filetypes.javascript").prettier
        },
        typescript = {
            require("formatter.filetypes.javascript").prettier
        }
    }
})
