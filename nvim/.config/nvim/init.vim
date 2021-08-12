let mapleader = ' '              " set space to leader
set number                       " show line numbers
set relativenumber               " show relative line numbers
set autoindent
set smartindent
set tabstop=2                    " default tab is 2
set shiftwidth=2                 " when indenting and dedenting
set clipboard=unnamedplus        " Copy paste between vim and everything else
set cursorline                   " Enable highlighting of the current line
set expandtab                    " Converts tabs to spaces
set hlsearch                     " highlight search results
set ignorecase                   " case insensitive searching
set nowrap                       " do not wrap long lines
set inccommand=split             " live substitution
set completeopt=menuone,noselect " complete options, from hrsh7th/nvim-compe
set scrolloff=10
set hidden                       " edit other buffers w/o saving
" default updatetime 4000ms is not good for async update
set updatetime=100

" download vim-plug if missing
" todo: check to see if this works
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent! execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif


call plug#begin()
  Plug 'junegunn/rainbow_parentheses.vim'
  " automatically run :RainbowParentheses on neovim startup
  augroup autoStartRainbow
    au! VimEnter * nested RainbowParentheses
  augroup end


  Plug 'junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

  " visually see your registers.  Control-R, or " or @ to see 
  Plug 'junegunn/vim-peekaboo'

  " dope color scheme
  Plug 'sainnhe/sonokai'

  " better syntax highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " surround text
  Plug 'tpope/vim-surround'

  " increment / decrement numbers and dates
  " Control+a Control+x
   Plug 'tpope/vim-speeddating'

  " lets me find my path in large JSON files
  " leader+d leader+g
  Plug 'mogelbrod/vim-jsonpath'
    " for only json files, the followiung mappings will work:
    au FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>
    au FileType json noremap <buffer> <silent> <leader>g :call jsonpath#goto()<CR>


  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    nmap <Leader>py <Plug>(Prettier)
    autocmd BufWritePre *.js,*.jsx,*.json,*.md,*.yaml,*.html PrettierAsync
     " autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
	
  " python formatting using black
  Plug 'psf/black', { 'branch': 'stable' }
    autocmd BufWritePre *.py execute ':Black'
  
  " couldn't get this working very well
  " Plug 'puremourning/vimspector'

	" easy commenting of lines
	Plug 'preservim/nerdcommenter'
	let g:NERDSpaceDelims = 1
	let g:NERDToggleCheckAllLines = 1

	" map Control+/ to toggle comments
  nmap <C-_> <Plug>NERDCommenterToggle
  vmap <C-_> <Plug>NERDCommenterToggle<CR>


  " Plug 'kyazdani42/nvim-web-devicons'
  Plug 'neovim/nvim-lspconfig'

  " completion thing
  Plug 'hrsh7th/nvim-compe'
  Plug 'windwp/nvim-autopairs'


  Plug 'glepnir/lspsaga.nvim'
  Plug 'simrat39/symbols-outline.nvim'
  
  " cool buffer bars
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'

  " " better status line
  " Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

  " requires
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mhinz/vim-signify'

call plug#end()
" load LSP configs
" source $HOME/.config/nvim/lsp.vim
" nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
" nnoremap <silent>gD :lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent>gi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent>gsh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent>gr :lua vim.lsp.buf.references()<CR>
" nnoremap <silent>grn :lua vim.lsp.buf.rename()<CR>
" nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
" nnoremap <silent>gca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
"
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })


lua << EOF
require'lspconfig'.pyright.setup{}
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = false,  -- auto select first item
})
EOF

" Important!!
if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'atlantis'
"let g:sonokai_enable_italic = 0
"let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" remap jk to escape
imap jk <Esc>
" moving between splits
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
" resizing splits
" nnoremap <C-j> :vertical resize +5<CR>
" nnoremap <C-k> :vertical resize -5<CR>
" remap leader c to close window - kind of slow though
nnoremap <leader>c :wincmd c<CR>

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" move between buffers
nmap <TAB> :bnext<CR>
nmap <S-TAB> :bprev<CR>

" close the current buffer
" nmap <leader>c :bd!<CR>

" shortcut to save
nmap <leader>w :w<cr>

" shortcut to quit
nmap <leader>q :q!<cr>

" shortcut to write and then quit
nmap <leader>z :wq!<cr>

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>

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
 
nmap <leader><leader> :set hlsearch! hlsearch?<cr>

" jump to important files

" cycle through popup menus with c-j and c-k
inoremap <expr><C-j> pumvisible()? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible()? "\<C-p>" : "\<Up>"


" let g:compe = {}
" let g:compe.enabled = v:true
" let g:compe.autocomplete = v:true
" let g:compe.debug = v:false
" let g:compe.min_length = 1
" let g:compe.preselect = 'enable'
" let g:compe.throttle_time = 80
" let g:compe.source_timeout = 200
" let g:compe.incomplete_delay = 400
" let g:compe.max_abbr_width = 100
" let g:compe.max_kind_width = 100
" let g:compe.max_menu_width = 100
" let g:compe.documentation = v:true

" let g:compe.source = {}
" let g:compe.source.path = v:true
" let g:compe.source.buffer = v:true
" let g:compe.source.calc = v:true
" let g:compe.source.nvim_lsp = v:true
" let g:compe.source.nvim_lua = v:true
" let g:compe.source.vsnip = v:true
" let g:compe.source.ultisnips = v:true

" source $HOME/.config/nvim/lsp.vim
" source $HOME/.config/nvim/lsp.vim
" source $HOME/.config/nvim/lsp.vim
" source $HOME/.config/nvim/lsp.vim
" source $HOME/.config/nvim/lsp.vim
" source $HOME/.config/nvim/lsp.vim
" source $HOME/.config/nvim/lsp.vim
" source $HOME/.config/nvim/lsp.vim
" source $HOME/.config/nvim/lsp.vim
" source $HOME/.config/nvim/lsp.vim
" source $HOME/.config/nvim/lsp.vim

