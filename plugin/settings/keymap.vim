" | Git add current buffer file | <leader>ga,gc,gp | {{{
nnoremap <silent> <Leader>ga :Gwrite<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gp :Gpush<CR>
" }}}

" | nerdtree | - | {{{
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 1

" Oh, I Love It! Taken from vim-vinegar
" but needed some refactoring
function! s:up_or_edit()
  if expand('%') == 'NERD_tree_1'
    execute 'NERDTreeToggle'
  elseif empty(expand("%"))
    execute 'NERDTreeToggle'
  else
    execute 'NERDTreeFind'
  endif
endfunction

nnoremap <silent> <Plug>Up :call <SID>up_or_edit()<CR>

if empty(maparg('-', 'n'))
  nmap - <Plug>Up
endif
nmap <buffer> - <Plug>Up
" }}}

" | Bufferline | {{{
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_show_bufnr = 0
" }}}

" | Find merge conflict markers | <leader>c | {{{
map <leader>c /\v^[<\|=>]{7}( .*\|$)<CR>
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
