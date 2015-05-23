" Keymaps

" Double Esc for clear search history
nnoremap <silent> jj :nohl<CR>

" Goto file with line number under cursor
nnoremap gf gF

" Show NERDTree
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>

" List toggle
nnoremap <silent> <Leader>l :set list!<CR>

" Close buffer with ask save it
nnoremap <silent> <Leader>w :confirm :Bclose<CR>
