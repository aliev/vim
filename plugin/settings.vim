" Find merge conflict markers | "<leader>gc" | {{{
map <Leader>c /\v^[<\|=>]{7}( .*\|$)<CR>
" }}}

" | Clear highlighting | "C-L" | {{{
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
" }}}

" Visually select the text that was last edited/pasted (Vimcast#26). | "gV" | {{{
noremap gV `[v`]
" }}}

" | Smart NERDTree | "-" | {{{
let NERDTreeMinimalUI = 1
let NERDTreeRespectWildIgnore = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1

function! s:smart_nerdtree()
  " For NERDTree buffer
  if expand('%') =~# 'NERD_tree_[0-9]'
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

nnoremap <silent> <Plug>Up :call <SID>smart_nerdtree()<CR>

if empty(maparg('-', 'n'))
  nmap - <Plug>Up
endif
nmap <buffer> - <Plug>Up
" }}}

" | Goto file with line number under cursor | "gf" | {{{
nnoremap gf gF
" }}}

" | List toggle | "<leader>l" | {{{
nnoremap <silent> <Leader>l :set list!<CR>
" }}}

" | Close the current buffer and move to the previous one | "<leader>w" | {{{
nnoremap <silent> <leader>w :bp <BAR> bd #<CR>
" }}}

" | Buffer list | "<leader>bb", "<leader>bn", "<leader>bp", "<leader>bf" | {{{
" Buffers list
nnoremap <Leader>bb :ls<CR>:b<Space>
" Files list
nnoremap <Leader>bf :e<Space><Tab>
" Next buffer
nnoremap <silent><Leader>bn :bn<CR>
" Previous buffer
nnoremap <silent><Leader>bp :bp<CR>
" }}}

" | Switch between the last edited two files | "<leader><leader>" {{{
nnoremap <leader><leader> <c-^>
" }}}

" | Search word under cursor | "\" | {{{
if !exists(":Ag")
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif
nnoremap \ :Ag <C-R>=expand("<cword>")<CR><CR>
" }}}

" Remove trailing whitespaces | "<leader>space" {{{
nnoremap <silent> <Leader><Space> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>
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


" vim:foldmethod=marker:foldlevel=0
