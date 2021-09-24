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
                require("indent_blankline").setup {
                    show_current_context = true,
                    -- show_trailing_blankline_indent = false
                }
            end
        }

        --https://github.com/lewis6991/gitsigns.nvim
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

        -- https://github.com/nvim-treesitter/nvim-treesitter
        use "nvim-treesitter/nvim-treesitter"

        use "ray-x/lsp_signature.nvim"
        -- better autocomplete stuff
        -- https://github.com/ray-x/lsp_signature.nvim
        -- use {
        --     "ray-x/lsp_signature.nvim",
        --     config = function()
        --         require("lsp_signature").setup {}
        --     end
        -- }

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
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup {}
            end
        }
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

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require("nvim-treesitter.configs").setup {
    eautopairs = {
        enable = true
    },
    ensure_installed = "maintained",
    highlight = {
        enable = true
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
    }
}

-- LSP settings
local nvim_lsp = require "lspconfig"

-- on_attach runs for every language server installed
local on_attach = function(_, bufnr)
    require "lsp_signature".on_attach()
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
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
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
local servers = {"pyright", "terraformls"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {select = true},
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if vim.fn.pumvisible() == 1 then
                    feedkey("<C-n>", "n")
                end
            end,
            {"i", "s"}
        ),
        ["<S-Tab>"] = cmp.mapping(
            function()
                if vim.fn.pumvisible() == 1 then
                    feedkey("<C-p>", "n")
                end
            end,
            {"i", "s"}
        )
    },
    sources = {
        {name = "nvim_lsp"}
    }
}

-- using nvim-autopairs with treesitter
-- https://github.com/windwp/nvim-autopairs#mapping-cr
local npairs = require("nvim-autopairs")
npairs.setup({check_ts = true})

-- mapping <CR> in nvim-autopairs
-- https://github.com/windwp/nvim-autopairs#mapping-cr
require("nvim-autopairs.completion.cmp").setup(
    {
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
        auto_select = true, -- automatically select the first item
        insert = false, -- use insert confirm behavior instead of replace
        map_char = {
            -- modifies the function or method delimiter by filetypes
            all = "(",
            tex = "{"
        }
    }
)
