local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup(
    {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            end
        },
        mapping = {
            -- TJ's mappings
            -- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/completion.lua
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
            ["<c-y>"] = cmp.mapping(
                cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                },
                {"i", "c"}
            ),
            ["<C-e>"] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            )
            -- ["<CR>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "nvim_lua"},
                {name = "luasnip"} -- For luasnip users.
            },
            {
                {name = "buffer", keyword_length = 2}
            }
        ),
        formatting = {
            format = lspkind.cmp_format(
                {
                    with_text = true,
                    menu = {
                        buffer = "[buf]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[api]",
                        path = "[path]",
                        luasnip = "[snip]"
                    }
                }
            )
        },
        experimental = {
            native_menu = false,
            ghost_text = true
        }
    }
)
