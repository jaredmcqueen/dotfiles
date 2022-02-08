-- notes about my config:
-- gitsigns.lua maps jumping to hunks
-- completion.lua maps a bunch of stuff
-- completion defines a python lsp server, i should move it

-- mapping function
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
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
-- end packer install

local use = require("packer").use
require("packer").startup(
    function()
        use "nvim-lua/plenary.nvim"
        use "wbthomason/packer.nvim"
        use "kyazdani42/nvim-web-devicons"
        use {"rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins"}
        -- https://github.com/numToStr/Comment.nvim
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end
        }

        -- https://github.com/sbdchd/neoformat
        use "sbdchd/neoformat"

        -- https://github.com/akinsho/bufferline.nvim
        use {
            "akinsho/bufferline.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("plugins.bufferline")
            end
        }

        -- https://github.com/lukas-reineke/indent-blankline.nvim
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require "plugins.indent-blankline"
            end
        }

        --https://github.com/lewis6991/gitsigns.nvim
        use {
            "lewis6991/gitsigns.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("plugins.gitsigns")
            end
        }

        -- https://github.com/nvim-treesitter/nvim-treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require("plugins.treesitter")
            end
        }

        -- https://github.com/jdhao/better-escape.vim
        use "jdhao/better-escape.vim"

        -- https://github.com/windwp/nvim-autopairs
        use {
            "windwp/nvim-autopairs",
            config = function()
                require "plugins.nvim-autopairs"
            end
        }

        -- https://github.com/nvim-telescope/telescope.nvim
        use {
            "nvim-telescope/telescope.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            config = function()
                require("telescope").setup()
            end
        }

        -- git plugin
        -- https://github.com/tpope/vim-fugitive
        use "tpope/vim-fugitive"
        -- use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github

        -- https://github.com/junegunn/vim-easy-align/blob/master/EXAMPLES.md
        use "junegunn/vim-easy-align"

        -- https://github.com/junegunn/vim-peekaboo
        use "junegunn/vim-peekaboo"

        -- https://github.com/tpope/vim-speeddating
        -- use "tpope/vim-speeddating"

        -- tpope/vim-surround
        use "tpope/vim-surround"

        -- https://github.com/hoob3rt/lualine.nvim
        use {
            "hoob3rt/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true},
            config = function()
                require("lualine").setup {
                    options = {
                        them = "tokyonight"
                    }
                }
            end
        }

        use {
            "folke/tokyonight.nvim",
            config = function()
                vim.g.tokyonight_style = "night"
                vim.g.tokyonight_italic_functions = true
                vim.g.tokyonight_sidebars = {"packer"}
                -- Change the "hint" color to the "orange" color, and make the "error" color bright red
                vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}

                -- Load the colorscheme
                vim.cmd [[colorscheme tokyonight]]
            end
        }

        use "L3MON4D3/LuaSnip"
        use "rafamadriz/friendly-snippets"

        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons" -- optional, for file icon
            },
            config = function()
                require("plugins.nvim-tree")
            end
        }

        use "norcalli/nvim-colorizer.lua" -- snip completion
        -- use {"ray-x/go.nvim"}

        -- lsp, see setup.completion for setup
        use {
            -- completions
            "hrsh7th/cmp-buffer", -- buffer completion
            "hrsh7th/cmp-nvim-lsp", -- enables auto imports
            "hrsh7th/cmp-nvim-lua", -- neovim-specific lua
            "hrsh7th/cmp-path", -- path completion
            "saadparwaiz1/cmp_luasnip", -- i'm not sure I need this
            "hrsh7th/nvim-cmp", -- completion
            "neovim/nvim-lspconfig", -- attatch, completions
            "onsails/lspkind-nvim", -- better looking icons
            "ray-x/lsp_signature.nvim",
            "williamboman/nvim-lsp-installer"
        }

        use {
            "b0o/schemastore.nvim",
            config = function()
                require("lspconfig").jsonls.setup {
                    settings = {
                        json = {
                            schemas = require("schemastore").json.schemas()
                        }
                    }
                }
            end
        }
    end
)

require("plugins/nvim-lsp-installer")
require("configs.cmp")

-- Options
local opt = vim.opt
local g = vim.g
g.mapleader = " "

opt.completeopt = "menu,menuone,noselect"
opt.title = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.cul = true -- cursor line

-- Indentline
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = {eob = " "}

opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
-- opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = true

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
-- opt.scrolloff = 1000

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
-- disable some builtin vim plugins
--
require "colorizer".setup()

local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

map("n", ";", ":") -- remap semicolon to colon
map("n", "<leader>so", ":source ~/.config/nvim/init.lua<CR>") -- source init.lua
map("v", "p", '"_dP') -- in visual mode, paste to black hole
map("n", "<TAB>", ":BufferLineCycleNext <CR>")
map("n", "<S-TAB>", ":BufferLineCyclePrev <CR>")

-- navigate while in insertmode
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-a>", "<End>")
map("i", "<C-k>", "<Up>")
-- map("i", "<C-j>", "<Down>")
-- map("i", "<C-a>", "<ESC>^i")

-- move cursor through wrapped lines
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {expr = true})
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {expr = true})
map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {expr = true})
map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {expr = true})

-- commenting
-- map("n", "<C-_>", "gcc")
-- map("v", "<C-_>", "gcc")

map("n", "<C-a>", ":%y+ <CR>") -- copy whole file content
-- map("n", "<S-t>", ":enew <CR>") -- new buffer
map("n", "<C-t>", ":tabnew <CR>") -- new tabs
map("n", "<C-s>", ":w <CR>") -- ctrl + s to save file

-- allows to move visual blocks of text up and down
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- telescope
map("n", "<leader>fb", ":Telescope buffers <CR>")
map("n", "<leader>ff", ":Telescope find_files <CR>")
map("n", "<leader>fa", ":Telescope find_files hidden=true <CR>")
map("n", "<leader>fc", ":Telescope git_commits <CR>")
map("n", "<leader>fs", ":Telescope git_status <CR>")
map("n", "<leader>fh", ":Telescope help_tags <CR>")
map("n", "<leader>fw", ":Telescope live_grep <CR>")
map("n", "<leader>fo", ":Telescope oldfiles <CR>")

-- tree
map("n", "<C-n>", ":NvimTreeToggle<CR>")

-- TODO convert to lua mapping
vim.cmd [[
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

vmap < <gv
vmap > >gv

nmap <leader><leader> :set hlsearch! hlsearch?<cr>
]]

-- file explorer/tree
-- toggle = "<C-n>"
-- focus = "<leader>e"
--autocmds
-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

vim.cmd [[
  augroup fmt
    autocmd!
    autocmd BufWritePre *.lua Neoformat
    autocmd BufNewFIle,BufRead *.gohtml set filetype=go
  augroup END
]]
