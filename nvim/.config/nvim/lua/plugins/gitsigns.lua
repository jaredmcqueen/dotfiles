local gitsigns = require("gitsigns")

gitsigns.setup(
    {
        keymaps = {
            buffer = true,
            noremap = true,
            ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
            ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
            ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
            ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
            ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
            ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
            ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
        },
        numhl = false,
        sign_priority = 5,
        signs = {
            add = {hl = "GitGutterAdd", text = "+"},
            change = {hl = "GitGutterChange", text = "~"},
            delete = {hl = "GitGutterDelete", text = "_"},
            topdelete = {hl = "GitGutterDelete", text = "‾"},
            changedelete = {hl = "GitGutterChange", text = "~"}
        },
        status_formatter = nil, -- Use default
        watch_gitdir = {
            interval = 100
        }
    }
)
