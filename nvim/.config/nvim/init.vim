let mapleader=' '              " set space to leader

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
set smartcase                    " case sensitive only when using capitals
set hidden                       " edit other buffers w/o saving
set expandtab                    " Converts tabs to spaces
set cursorline                   " Enable highlighting of the current line
set scrolloff=10
set clipboard+=unnamedplus        " Copy paste between vim and everything else
set noerrorbells
set termguicolors                " gives more color to neovim
set breakindent                  " wrapped code stays indented
set undofile
set undodir=~/.vim/undodir

" TODO: I think the noselect needs to be removed
set completeopt=menu,menuone,noselect

luafile $HOME/.config/nvim/plugins.lua
set hlsearch                     " start with highlighting on
set autoindent
set smartindent
set updatetime=100

" set color scheme
colorscheme onedark

"easy align
xmap ga <Plug>(EasyAlign)
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

"easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>

" clear highlights
nmap <leader><leader> :set hlsearch! hlsearch?<cr>

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
