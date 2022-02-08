local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

cmp.setup(
    {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        mapping = {
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
            ["<C-y>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
            ["<C-e>"] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            ),
            -- disabled for autopairs mapping
            ["<CR>"] = cmp.mapping.confirm(
                {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                }
            )
        },
        documentation = {
            border = "rounded",
            winhighlight = "FloatBorder:FloatBorder,Normal:Normal"
        },
        experimental = {
            ghost_text = true
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "nvim_lua"},
                {name = "buffer"},
                {name = "luasnip"},
                {name = "path"}
            }
        ),
        formatting = {
            format = lspkind.cmp_format(
                {
                    with_text = true,
                    menu = {
                        nvim_lsp = "[lsp]",
                        luasnip = "[snip]",
                        buffer = "[buf]",
                        path = "[path]",
                        nvim_lua = "[nvim_api]"
                    }
                }
            )
        }
    }
)

-- TODO: figure out what this does
vim.cmd([[
  autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
]])

cmp.setup.cmdline(
    "/",
    {
        sources = {
            {name = "buffer"}
        }
    }
)

-- cmp.setup.cmdline(':', {
--   sources = cmp.config.sources({
--     { name = 'path' },
--   }, {
--     { name = 'cmdline' },
--   }),
-- })
