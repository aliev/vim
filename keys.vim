" Keymaps

nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>s :CtrlPBufTag<cr>

" Comment selected line
map <leader>/ :TComment<CR>

" File autocomplte
imap <leader>f <c-x><c-f>

" Default autocomplete
imap <leader>c <c-x><c-o>

" List toggle
nnoremap <leader>l :set list!<CR>

" Close buffer with ask save it
nnoremap <leader>w :confirm :Bclose<CR>

nnoremap <leader>e :NERDTreeToggle<CR>

" T-Comment keymap
let g:tcommentMapLeader2 = '<leader>/'

" Double Esc for clear search history
nnoremap <silent> <Esc><Esc> :let @/=""<CR>
