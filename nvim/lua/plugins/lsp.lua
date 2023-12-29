require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "csharp_ls",
        "omnisharp_mono", "gopls", "graphql", "html", "jsonls", "jdtls", 
        "tsserver", "ltex", "lua_ls", "marksman", "jedi_language_server",
        "r_language_server", "sqlls", "vuels", "yamlls", "lemminx"
    },
}
