" download vim-plug if missing
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent! execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif


call plug#begin()
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

  " visually see your registers
  Plug 'junegunn/vim-peekaboo'

  " dope color scheme
  Plug 'sainnhe/sonokai'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " surround text
  Plug 'tpope/vim-surround'

  " increment / decrement numbers and dates
  Plug 'tpope/vim-speeddating'

  " lets me find my path in large JSON files
  Plug 'mogelbrod/vim-jsonpath'
    " for only json files, the followiung mappings will work:
    au FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>
    au FileType json noremap <buffer> <silent> <leader>g :call jsonpath#goto()<CR>


  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    nmap <Leader>py <Plug>(Prettier)
    " autocmd BufWritePre *.js,*.jsx,*.json,*.md,*.yaml,*.html PrettierAsync
		" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

	" easy commenting of lines
	Plug 'preservim/nerdcommenter'
		let g:NERDSpaceDelims = 1
		let g:NERDToggleCheckAllLines = 1
		" map Control+/ to toggle comments
		nmap <C-_> <Plug>NERDCommenterToggle
    vmap <C-_> <Plug>NERDCommenterToggle<CR>

	" python formatting using black
  Plug 'psf/black', { 'branch': 'stable' }
    autocmd BufWritePre *.py execute ':Black'

  " Plug 'kyazdani42/nvim-web-devicons'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'


call plug#end()
