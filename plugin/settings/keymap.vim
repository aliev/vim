" | Git add current buffer file | <leader>ga,gc,gp | {{{
" Add current file <leader>ga
map <silent> <Leader>ga :Gwrite<CR>
" Commit current file <leader>gc
map <silent> <Leader>gc :Gcommit<CR>
" Push <leader>gp
map <silent> <Leader>gp :Gpush<CR>
" Revert current file to last checked in version <leader>gr
map <silent> <Leader>gr :Gread<CR>
" Git status
map <silent> <Leader>gs :Gstatus<CR>
" Find merge conflict markers <leader>c
map <Leader>c /\v^[<\|=>]{7}( .*\|$)<CR>
" }}}

" | nerdtree | - | {{{
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 1

function! s:comfortable_nerd()
  " For NERDTree buffer
  if expand('%') == 'NERD_tree_1'
    " Close NERDTree
    execute 'NERDTreeToggle'
  " If buffer if empty
  elseif empty(expand("%"))
    " Just open NERDTree
    execute 'NERDTreeToggle'
  " If file opened in buffer
  else
    " Run NERDTreeFind
    execute 'NERDTreeFind'
  endif
endfunction

nnoremap <silent> <Plug>Up :call <SID>comfortable_nerd()<CR>

if empty(maparg('-', 'n'))
  nmap - <Plug>Up
endif
nmap <buffer> - <Plug>Up
" }}}

" | Bufferline | {{{
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = '[ '
let g:bufferline_active_buffer_right = ']'
let g:bufferline_show_bufnr = 0
" }}}

" | :<tab> shows command list from fzf | {{{
set wildcharm=<Tab>

cnoremap <expr><tab>
      \ getcmdtype() == ":"
        \ ? getcmdpos() > 1
          \ ? "\<Tab>"
        \ : "Commands<CR>"
      \ : ""
" }}}

" | Goto file with line number under cursor | gf | {{{
nnoremap gf gF
" }}}

" | List toggle | <leader>l | {{{
nnoremap <silent> <Leader>l :set list!<CR>
" }}}

" | Close the current buffer and move to the previous one | <leader>w | {{{
nnoremap <silent> <leader>w :bp <BAR> bd #<CR>
" }}}

" | Quickly jump by declarations list | <leader>s |{{{
nnoremap <silent> <Leader>s :BTags<CR>
" }}}

" | Buffer list | <leader>b | {{{
nnoremap <silent> <Leader>b :Buffers<CR>
" }}}

" | Open files | <leader>f | {{{
nnoremap <silent> <Leader>f :Files<CR>
" }}}

" | Give directory for current file and open command mode | <leader>. | {{{
nnoremap <leader>. <Esc>: <C-R>=expand("%:p:h") . "/" <CR><Home>
" }}}

" | Switch between the last edited two files | <leader><leader> {{{
nnoremap <leader><leader> <c-^>
" }}}

" | Search word under cursor by using Ag | <leader>ag | {{{
noremap <silent><Leader>ag :Ag <C-R>=expand("<cword>")<CR><CR>
" }}}

" | Readline-style key bindings in command-line (excerpt from rsi.vim) | {{{
cnoremap        <C-A> <Home>
cnoremap        <C-B> <Left>
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"
cnoremap        <M-b> <S-Left>
cnoremap        <M-f> <S-Right>
silent! exe "set <S-Left>=\<Esc>b"
silent! exe "set <S-Right>=\<Esc>f"
" }}}

" vim:foldmethod=marker:foldlevel=1
