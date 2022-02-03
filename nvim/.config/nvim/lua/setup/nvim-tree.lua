local nvim_tree = require("nvim-tree")
local g = vim.g

g.nvim_tree_add_trailing = 1 -- append a trailing slash to folder names
g.nvim_tree_git_hl = 1
g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        deleted = "",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untracked = "★"
    },
    folder = {
        default = "",
        empty = "",
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = ""
    }
}

nvim_tree.setup {
    auto_resize = true,
    git = {
        enable = true,
        ignore = true
    }
}
