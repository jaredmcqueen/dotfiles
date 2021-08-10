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
set completeopt=menuone,noselect " complete options
set scrolloff=10
" default updatetime 4000ms is not good for async update
set updatetime=100

" load plugins
source $HOME/.config/nvim/plugins.vim

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
nnoremap <C-j> :vertical resize +5<CR>
nnoremap <C-k> :vertical resize -5<CR>
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

" indent / dedent blocks continuously
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

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

" X cuts to register d
vmap X "_d

" greatest remap ever - paste repeatedly?
vnoremap <leader>p "_dP
 
" clear serach
nmap <leader><leader> :set hlsearch! hlsearch?<cr>

" jump to important files

" cycle through popup menus with c-j and c-k
inoremap <expr><C-j> pumvisible()? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible()? "\<C-p>" : "\<Up>"


" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)


let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
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

