let mapleader = ' '              " set space to leader
set number                       " show line numbers
set relativenumber               " show relative line numbers
set tabstop=2                    " default tab is 2
set shiftwidth=2                 " when indenting and dedenting
set nowrap                       " do not wrap long lines
set ignorecase                   " case insensitive searching
set hidden                       " edit other buffers w/o saving
set expandtab                    " Converts tabs to spaces
set cursorline                   " Enable highlighting of the current line
set scrolloff=10
set clipboard=unnamedplus        " Copy paste between vim and everything else
set termguicolors                " gives more color to neovim

"set inccommand=split             " live substitution
"set hlsearch                     " highlight search results
"set autoindent
"set smartindent
"set updatetime=100

" plugins
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent! execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'famiu/feline.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'andymass/vim-matchup'
Plug 'jdhao/better-escape.vim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'windwp/nvim-autopairs'
Plug 'sbdchd/neoformat'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-fugitive'
call plug#end()

lua require'nvim_comment'.setup{}
lua require'nvim-web-devicons'.setup{}
lua require'feline'.setup{}
lua require'bufferline'.setup{}
lua require'indent_blankline'.setup{}
lua require'nvim-treesitter.configs'.setup{ ensure_installed = {'bash', 'comment', 'dockerfile', 'go', 'json', 'lua', 'python', 'regex', 'toml', 'vim', 'yaml'}, highlight = {enable = true} }
lua require'gitsigns'.setup()
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.terraformls.setup{}
lua require'lsp_signature'.setup()

nmap <C-_> :CommentToggle <CR>
vmap <C-_> :CommentToggle <CR>gv

" reload vim config
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" move between split buffers with control+h,j,k,l
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
" close a window with control+c

" allows to move visual blocks of text up and down
nmap <A-k> :m .-2<CR>==
nmap <A-j> :m .+1<CR>==
imap <A-j> <Esc>:m .+1<CR>==gi
imap <A-k> <Esc>:m .-2<CR>==gi
vmap <A-j> :m '>+1<CR>gv=gv
vmap <A-k> :m '<-2<CR>gv=gv

" Allow continual indent/dedent in visual block
vmap < <gv
vmap > >gv

" cut txt to black hole
vmap X "_d
