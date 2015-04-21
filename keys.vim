" alksdjaksl
" Keymaps

" File autocomplte
imap <leader>f <c-x><c-f>

" Default autocomplete
imap <leader>c <c-x><c-o>

" List toggle
nnoremap <leader>l :set list!<CR>

" Close buffer with ask save it
nnoremap <leader>w :confirm :Bclose<CR>

" Double Esc for clear search history
nnoremap <Esc><Esc> :let @/=""<CR>

" Goto file with line number under cursor
nnoremap gf gF
