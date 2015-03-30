" alksdjaksl
" Keymaps

" CtrlP
map <leader>f :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>s :CtrlPBufTag<CR>
map <leader>u :GitGutterRevertHunk<CR>

" File autocomplte
imap <leader>f <c-x><c-f>

" Default autocomplete
imap <leader>c <c-x><c-o>

" List toggle
nnoremap <leader>l :set list!<CR>

" Close buffer with ask save it
nnoremap <leader>w :confirm :Bclose<CR>

" Open NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>

" Double Esc for clear search history
nnoremap <Esc><Esc> :let @/=""<CR>

" Goto file with line number under cursor
nnoremap gf gF
