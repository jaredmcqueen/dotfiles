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
            requires = {"kyazdani42/nvim-web-devicons", opt = true},
            config = function()
                require("lualine").setup {
                    options = {theme = "onedark"}
                }
            end
        }

        -- https://github.com/sbdchd/neoformat
        -- npm install -g lua-fmt
        -- npm install -g pyright
        use "sbdchd/neoformat"

        -- https://github.com/akinsho/bufferline.nvim
        use {
            "akinsho/bufferline.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("bufferline").setup {}
            end
        }

        -- https://github.com/lukas-reineke/indent-blankline.nvim
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("configs.indent_blankline")
            end
        }

        --https://github.com/lewis6991/gitsigns.nvim
        use {
            "lewis6991/gitsigns.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("configs.gitsigns")
            end
        }

        -- https://github.com/nvim-treesitter/nvim-treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require("nvim-treesitter.configs").setup {
                    ensure_installed = {
                        "lua"
                    },
                    highlight = {
                        enable = true,
                        use_languagetree = true
                    },
                    matchup = {
                        enable = true -- forces vim-matchup
                    }
                }
            end
        }

        -- https://github.com/andymass/vim-matchup
        use "andymass/vim-matchup"

        -- https://github.com/jdhao/better-escape.vim
        use "jdhao/better-escape.vim"

        -- https://github.com/windwp/nvim-autopairs
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup {}
            end
        }

        -- https://github.com/kyazdani42/nvim-tree.lua
        use "kyazdani42/nvim-tree.lua"

        -- https://github.com/nvim-telescope/telescope.nvim
        use {
            "nvim-telescope/telescope.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            config = function()
                require("telescope").setup {}
            end
        }

        -- git plugin
        -- https://github.com/tpope/vim-fugitive
        use "tpope/vim-fugitive"
        use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github

        -- https://github.com/junegunn/vim-easy-align/blob/master/EXAMPLES.md
        use "junegunn/vim-easy-align"

        -- https://github.com/junegunn/vim-peekaboo
        use "junegunn/vim-peekaboo"

        -- https://github.com/tpope/vim-speeddating
        use "tpope/vim-speeddating"

        -- tpope/vim-surround
        use "tpope/vim-surround"

        -- https://github.com/joshdick/onedark.vim
        use "joshdick/onedark.vim"

        -- lsp, see configs.completion for setup
        use "neovim/nvim-lspconfig" -- attatch, completions
        use "onsails/lspkind-nvim" -- better looking icons
        use "hrsh7th/nvim-cmp" -- completion
        use "hrsh7th/cmp-buffer" -- buffer completion
        use "hrsh7th/cmp-path" -- path completion
        use "hrsh7th/cmp-nvim-lua" -- neovim-specific lua
        use "hrsh7th/cmp-nvim-lsp" -- enables auto imports
        use "saadparwaiz1/cmp_luasnip" -- snip completion

        use "norcalli/nvim-colorizer.lua" -- snip completion
    end
)

require("configs.completion")
require("configs.go")

-- Options
local opt = vim.opt
local g = vim.g
g.mapleader = " "

opt.completeopt = "menuone,noselect"
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
opt.scrolloff = 1000

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
-- disable some builtin vim plugins
--
vim.cmd [[colorscheme onedark]]
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
map("n", "<C-_>", ":CommentToggle<CR>")
map("v", "<C-_>", ":CommentToggle<CR>")

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
vim.cmd [[
  augroup fmt
    autocmd!
    autocmd BufWritePre *.lua undojoin | Neoformat
  augroup END
]]
