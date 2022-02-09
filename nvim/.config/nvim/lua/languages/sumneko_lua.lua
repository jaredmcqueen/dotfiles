return {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"},
                disable = {
                    "different-requires"
                }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true
                },
                maxPreload = 10000
            }
        }
    }
}
