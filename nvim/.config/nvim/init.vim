if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let mapleader = ' '              " set space to leader
set number                       " show line numbers
set relativenumber               " show relative line numbers
" TODO: change based on file type
" JSON, JS should be 2
" python should be 4
" go should not have expanded tabs
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
"set signcolumn=auto:4

" from nvim-cmp
" TODO: I think the noselect needs to be removed
set completeopt=menu,menuone,noselect

luafile $HOME/.config/nvim/plugins.lua
"set inccommand=split             " live substitution
"set hlsearch                     " highlight search results
"set autoindent
"set smartindent
"set updatetime=100#

" let g:sonokai_style = 'atlantis'
" colorscheme sonokai

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

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fe <cmd>Telescope file_browser<cr>
" 
"   Plug 'junegunn/vim-easy-align'
"     " Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"     " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" LSP config (the mappings used in the default file don't quite work right)
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>

" clear highlights
nmap <leader><leader> :set hlsearch! hlsearch?<cr>

" cycle through popup menus with c-j and c-k
" cnoremap <expr> <C-j> wildmenumode() ? "\<C-n>":"\<Down>"
" cnoremap <expr> <C-k> wildmenumode() ? "\<C-p>":"\<Up>"
