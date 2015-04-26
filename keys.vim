" alksdjaksl
" Keymaps

" File autocomplte
imap <leader>f <c-x><c-f>

" Default autocomplete keymap
imap <leader>c <c-x><c-o>

" Double Esc for clear search history
nnoremap <Esc><Esc> :let @/=""<CR>

" Goto file with line number under cursor
nnoremap gf gF

" Show NERDTree
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
" Open CtrlP
nnoremap <silent> <Leader>f :CtrlP<CR>
" Show buffers
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
" Show tags in current buffer
nnoremap <silent> <Leader>s :CtrlPBufTag<CR>
" List toggle
nnoremap <silent> <Leader>l :set list!<CR>
" Close buffer with ask save it
nnoremap <silent> <Leader>w :confirm :Bclose<CR>
