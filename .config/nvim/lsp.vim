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

lua << EOF
require'lspconfig'.pyright.setup{}
EOF
