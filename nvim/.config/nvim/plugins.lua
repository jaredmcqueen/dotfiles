-- Install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 1 then
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec(
    [[
    augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
    augroup end
  ]],
    false
)

local use = require("packer").use
require("packer").startup(
    function()
        use "wbthomason/packer.nvim"

        -- https://github.com/terrortylor/nvim-comment
        use {
            "terrortylor/nvim-comment",
            config = function()
                require("nvim_comment").setup {}
            end
        }

        -- https://github.com/hoob3rt/lualine.nvim
        use {
            "hoob3rt/lualine.nvim",
            config = function()
                require("lualine").setup {
                    options = {theme = "onedark"}
                }
            end,
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        }

        -- https://github.com/sbdchd/neoformat
        -- npm install -g lua-fmt
        -- npm install -g pyright
        use "sbdchd/neoformat"

        -- https://github.com/akinsho/bufferline.nvim
        use {
            "akinsho/bufferline.nvim",
            config = function()
                require("bufferline").setup {}
            end,
            requires = "kyazdani42/nvim-web-devicons"
        }

        -- indent guides
        -- https://github.com/lukas-reineke/indent-blankline.nvim
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent-blankline").setup {

-- vim.g.indent_blankline_char = "┊"
-- vim.g.indent_blankline_filetype_exclude = {"help", "packer"}
-- vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
-- vim.g.indent_blankline_char_highlight = "LineNr"
-- vim.g.indent_blankline_show_trailing_blankline_indent = false


        }
            end
        }

        -- better highlighting
        -- https://github.com/nvim-treesitter/nvim-treesitter
        use "nvim-treesitter/nvim-treesitter"
        use "nvim-treesitter/nvim-treesitter-textobjects"

        --gutter signs
        --lewis6991/gitsigns.nvim
        use {
            "lewis6991/gitsigns.nvim",
            requires = {
                "nvim-lua/plenary.nvim"
            },
            config = function()
                require("gitsigns").setup {
                    signs = {
                        add = {hl = "GitGutterAdd", text = "+"},
                        change = {hl = "GitGutterChange", text = "~"},
                        delete = {hl = "GitGutterDelete", text = "_"},
                        topdelete = {hl = "GitGutterDelete", text = "‾"},
                        changedelete = {hl = "GitGutterChange", text = "~"}
                    }
                }
            end
        }

        -- better autocomplete stuff
        -- https://github.com/ray-x/lsp_signature.nvim
        use "ray-x/lsp_signature.nvim"

        -- better %
        -- https://github.com/andymass/vim-matchup
        use "andymass/vim-matchup"
        --"
        -- faster escape
        -- https://github.com/jdhao/better-escape.vim
        -- works without any setup
        use "jdhao/better-escape.vim"
        --"
        -- completion
        -- https://github.com/hrsh7th/nvim-cmp
        use "hrsh7th/nvim-cmp"
        -- https://github.com/neovim/nvim-lspconfig
        use "neovim/nvim-lspconfig"
        -- https://github.com/hrsh7th/cmp-nvim-lsp
        use "hrsh7th/cmp-nvim-lsp"
        -- https://github.com/hrsh7th/cmp-buffer
        use "hrsh7th/cmp-buffer"
        -- https://github.com/hrsh7th/nvim-cmp
        --
        -- way better auto-pairing
        -- https://github.com/windwp/nvim-autopairs
        use "windwp/nvim-autopairs"
        --"
        --"
        -- tree
        -- https://github.com/kyazdani42/nvim-tree.lua
        use "kyazdani42/nvim-tree.lua"
        --"
        -- popup window thingy
        -- https://github.com/nvim-telescope/telescope.nvim
        use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}
        --"
        -- git plugin
        -- https://github.com/tpope/vim-fugitive
        use "tpope/vim-fugitive"
        use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github

        use "junegunn/vim-easy-align"
        use "junegunn/vim-peekaboo"

        use "tpope/vim-speeddating"
        -- https://github.com/joshdick/onedark.vim
        use "joshdick/onedark.vim"
    end
)

--require('lspconfig').pyright.setup{}
--require('lspconfig').terraformls.setup{}
require("lsp_signature").setup {}

--Incremental live completion (note: this is now a default on master)
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[colorscheme onedark]]

--Set statusbar

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})

-- Highlight on yank
vim.api.nvim_exec(
    [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
    false
)

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true})

--Map blankline

-- Telescope
require("telescope").setup {
    defaults = {
        mapings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false
            }
        }
    }
}
--Add leader shortcuts
vim.api.nvim_set_keymap(
    "n",
    "<leader><space>",
    [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>sf",
    [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>sb",
    [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>sh",
    [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>st",
    [[<cmd>lua require('telescope.builtin').tags()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>sd",
    [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>sp",
    [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>so",
    [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>?",
    [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
    {noremap = true, silent = true}
)

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "bash",
        "comment",
        "dockerfile",
        "go",
        "json",
        "lua",
        "python",
        "regex",
        "toml",
        "vim",
        "yaml"
    },
    highlight = {
        enable = true -- false will disable the whole extension
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    },
    indent = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer"
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer"
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer"
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer"
            }
        }
    }
}

-- LSP settings
local nvim_lsp = require "lspconfig"
local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>e",
        "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>so",
        [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
        opts
    )
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Enable the following language servers
local servers = {"pyright"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- luasnip setup
-- local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {
    snippet = {},
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ["<Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                --      elseif luasnip.expand_or_jumpable() then
                --        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                --      elseif luasnip.jumpable(-1) then
                --        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
            else
                fallback()
            end
        end
    },
    sources = {
        {name = "nvim_lsp"}
        --   { name = 'luasnip' },
    }
}