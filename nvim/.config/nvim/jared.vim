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

" my fav color scheme
" https://github.com/sainnhe/sonokai
Plug 'sainnhe/sonokai'

" lua functions that other plugins require
" https://github.com/nvim-lua/plenary.nvim
Plug 'nvim-lua/plenary.nvim'

" lua commentor
" https://github.com/terrortylor/nvim-comment
Plug 'terrortylor/nvim-comment'

" icons for other plugins
" https://github.com/kyazdani42/nvim-web-devicons
Plug 'kyazdani42/nvim-web-devicons'

" minimal, sylish statusline?
" famiu/feline.nvim
Plug 'famiu/feline.nvim'

" buffer tabs
" https://github.com/akinsho/bufferline.nvim
Plug 'akinsho/bufferline.nvim'

" indent guides
" https://github.com/lukas-reineke/indent-blankline.nvim
Plug 'lukas-reineke/indent-blankline.nvim'

" better highlighting
" https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"gutter signs
"lewis6991/gitsigns.nvim
Plug 'lewis6991/gitsigns.nvim'

" lsp support
" https://github.com/neovim/nvim-lspconfig
Plug 'neovim/nvim-lspconfig'

" better autocomplete stuff
" https://github.com/ray-x/lsp_signature.nvim
Plug 'ray-x/lsp_signature.nvim'

" better %
" https://github.com/andymass/vim-matchup
Plug 'andymass/vim-matchup'

" faster escape
" https://github.com/jdhao/better-escape.vim
Plug 'jdhao/better-escape.vim'

" completeion
" https://github.com/hrsh7th/nvim-cmp
Plug 'hrsh7th/nvim-cmp'

" completion of buffer words
" https://github.com/hrsh7th/cmp-buffer
Plug 'hrsh7th/cmp-buffer'

" way better auto-pairing
" https://github.com/windwp/nvim-autopairs
Plug 'windwp/nvim-autopairs'

" better formatting
" https://github.com/sbdchd/neoformat
Plug 'sbdchd/neoformat'

" tree
" https://github.com/kyazdani42/nvim-tree.lua
Plug 'kyazdani42/nvim-tree.lua'

" popup window thingy
" https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-telescope/telescope.nvim'

" git plugin
" https://github.com/tpope/vim-fugitive
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




let g:sonokai_style = 'atlantis'
colorscheme sonokai




"easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)






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

" paste over selected text, sending highlighted text to black hole
noremap <leader>p "_dP

" move between buffers
nmap <TAB> :bnext<CR>
nmap <S-TAB> :bprev<CR>


" if has("termguicolors")     " set true colors
"     set t_8f=\[[38;2;%lu;%lu;%lum
"     set termguicolors
"     set t_8b=\[[48;2;%lu;%lu;%lum
" endif
" 
" " download vim-plug if missing
" " todo: check to see if this works
" 
" 
" 
" " Install nvim-cmp
" Plug 'hrsh7th/nvim-cmp'
" 
" " Install snippet engine (This example installs [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip))
" Plug 'hrsh7th/vim-vsnip'
" 
" " Install the buffer completion source
" Plug 'hrsh7th/cmp-buffer'
" 
" 
"   Plug 'junegunn/rainbow_parentheses.vim'
"   " automatically run :RainbowParentheses on neovim startup
"   augroup autoStartRainbow
"     au! VimEnter * nested RainbowParentheses
"   augroup end
" 
"   Plug 'nvim-lua/plenary.nvim'
"   Plug 'nvim-telescope/telescope.nvim'
"     " Find files using Telescope command-line sugar.
"     nnoremap <leader>ff <cmd>Telescope find_files<cr>
"     nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"     nnoremap <leader>fb <cmd>Telescope buffers<cr>
"     nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"     nnoremap <leader>fe <cmd>Telescope file_browser<cr>
" 
"   Plug 'junegunn/vim-easy-align'
"     " Start interactive EasyAlign in visual mode (e.g. vipga)
"     xmap ga <Plug>(EasyAlign)
"     " Start interactive EasyAlign for a motion/text object (e.g. gaip)
"     nmap ga <Plug>(EasyAlign)
" 
"   " visually see your registers.  Control-R, or " or @ to see 
"   Plug 'junegunn/vim-peekaboo'
" 
"   " dope color scheme
"   Plug 'sainnhe/sonokai'
" 
"   " better syntax highlighting
"   Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" 
"   " surround text
"   Plug 'tpope/vim-surround'
" 
"   " increment / decrement numbers and dates
"   " Control+a Control+x
"    Plug 'tpope/vim-speeddating'
" 
"   " lets me find my path in large JSON files
"   " leader+d leader+g
"   Plug 'mogelbrod/vim-jsonpath'
"     " for only json files, the followiung mappings will work:
"     au FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>
"     au FileType json noremap <buffer> <silent> <leader>g :call jsonpath#goto()<CR>
" 
" 
"   " Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"     " nmap <Leader>py <Plug>(Prettier)
"     " autocmd BufWritePre *.js,*.jsx,*.json,*.md,*.yaml,*.html PrettierAsync
"      " autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" 	
"   " python formatting using black
"   " Plug 'psf/black', { 'branch': 'stable' }
"     " autocmd BufWritePre *.py execute ':Black'
"   
"   " couldn't get this working very well
"   " Plug 'puremourning/vimspector'
" 
" 	" easy commenting of lines
" 	Plug 'preservim/nerdcommenter'
" 	let g:NERDSpaceDelims = 1
" 	let g:NERDToggleCheckAllLines = 1
" 
" 	" map Control+/ to toggle comments
" 
" 
"   Plug 'neovim/nvim-lspconfig'
"   Plug 'kabouzeid/nvim-lspinstall'
" 
"   " completion thing
"   " Plug 'hrsh7th/nvim-compe'
"   " Plug 'windwp/nvim-autopairs'
" 
" 
"   Plug 'glepnir/lspsaga.nvim'
"   Plug 'simrat39/symbols-outline.nvim'
"   
"   " cool buffer bars
"   Plug 'kyazdani42/nvim-web-devicons'
"   Plug 'romgrk/barbar.nvim'
" 
"   " " better status line
"   " Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" 
"   " requires
"   Plug 'kyazdani42/nvim-web-devicons' " for file icons
"   Plug 'kyazdani42/nvim-tree.lua'
" 
"   Plug 'vim-airline/vim-airline'
"   Plug 'vim-airline/vim-airline-themes'
"   Plug 'mhinz/vim-signify'
" 
" 
" 
" 
" lua << EOF
" require'lspinstall'.setup() -- important
" 
" local servers = require'lspinstall'.installed_servers()
" for _, server in pairs(servers) do
"   require'lspconfig'[server].setup{}
" end
" EOF






" lua << EOF
" -- require'lspconfig'.pyright.setup{}
" -- require("nvim-autopairs.completion.compe").setup({
" --   map_cr = true, --  map <CR> on insert mode
" --   map_complete = true, -- it will auto insert `(` after select function or method item
" --   auto_select = false,  -- auto select first item
" -- })
" EOF

" Important!!


" remap jk to escape
" imap jk <Esc>
" remap leader c to close window - kind of slow though

" LSP config (the mappings used in the default file don't quite work right)
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>


" close the current buffer
" nmap <leader>c :bd!<CR>

" shortcut to save
" nmap <leader>w :w<cr>

" shortcut to quit
" nmap <leader>q :q!<cr>

" shortcut to write and then quit
" nmap <leader>z :wq!<cr>

" edit ~/.config/nvim/init.vim
" map <leader>ev :e! ~/.config/nvim/init.vim<cr>




" clear highlights
" nmap <leader><leader> :set hlsearch! hlsearch?<cr>


" cycle through popup menus with c-j and c-k
" cnoremap <expr> <C-j> wildmenumode() ? "\<C-n>":"\<Down>"
" cnoremap <expr> <C-k> wildmenumode() ? "\<C-p>":"\<Up>"