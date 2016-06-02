" Find merge conflict markers <leader>gc | {{{
map <Leader>c /\v^[<\|=>]{7}( .*\|$)<CR>
" }}}

" | Use <C-L> to clear the highlighting of :set hlsearch. | {{{
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
" }}}

" Visually select the text that was last edited/pasted (Vimcast#26). | gV | {{{
noremap gV `[v`]
" }}}

" | nerdtree | - | {{{
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1

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

" | Goto file with line number under cursor | gf | {{{
nnoremap gf gF
" }}}

" | List toggle | <leader>l | {{{
nnoremap <silent> <Leader>l :set list!<CR>
" }}}

" | Close the current buffer and move to the previous one | <leader>w | {{{
nnoremap <silent> <leader>w :bp <BAR> bd #<CR>
" }}}

" | Buffer list | <leader>b | {{{
nnoremap <Leader>bb :buffers<CR>:buffer<Space>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
" }}}

" | Open files | <leader>f | {{{
nnoremap <Leader>f :e<Space><Tab>
" }}}

" | Give directory for current file and open command mode | <leader>. | {{{
nnoremap <leader>. <Esc>: <C-R>=expand("%:p:h") . "/" <CR><Home>
" }}}

" | Switch between the last edited two files | <leader><leader> {{{
nnoremap <leader><leader> <c-^>
" }}}

" | Silver searcher | <leader>ag, \ and :Ag | {{{
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
noremap <silent><Leader>ag :Ag <C-R>=expand("<cword>")<CR><CR><CR>:cw<CR>
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

" Expand %% to path of current buffer in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Remove trailing whitespaces
nnoremap <silent> <Leader><Space> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>

" vim:foldmethod=marker:foldlevel=1
