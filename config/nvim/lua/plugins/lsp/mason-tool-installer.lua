return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "texlab",
                "rust_analyzer",
                "bashls",
                "html",
                "cssls",
                "pyright",
                "jsonls",
                "dockerls",
                "docker_compose_language_service",
                "gradle_ls",
                "tailwindcss",
                "eslint",

                -- Lua
                "lua_ls",
                "stylua",
            }
        }
    }
}
