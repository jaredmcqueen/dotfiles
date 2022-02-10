local treesitter_config = require("nvim-treesitter.configs")

treesitter_config.setup(
    {
        highlight = {
            enable = true
        },
        ensure_installed = {
            "lua"
        },
        rainbow = {
            enable = true,
            extended_mode = false
        },
        autotag = {enable = true},
        autopairs = {enable = true},
        matchup = {
            enable = true -- forces vim-matchup
        }
    }
)
