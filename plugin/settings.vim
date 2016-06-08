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
let g:NERDTreeMinimalUI = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1

function! s:smart_nerdtree()
  " For NERDTree buffer
  if expand('%') =~# 'NERD_tree'
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

" Buffers " {{{
" List of buffers
nnoremap <leader>bb :ls<CR>:b<space>
" Next buffer
nnoremap <silent><Leader>bn :bn<CR>
" Previous buffer
nnoremap <silent><Leader>bp :bp<CR>
" }}}

" | Switch between the last edited two files | "<leader><leader>" {{{
nnoremap <leader><leader> <c-^>
" }}}

" | Search word under cursor | "\" | {{{
function! s:Ag(args)
  let l:_makeprg = &makeprg
  let l:_errorformat = &errorformat

  let &makeprg = &grepprg . ' ' . a:args
  let &errorformat = &grepformat

  Make

  let &makeprg = l:_makeprg
  let &errorformat = l:_errorformat
endfunction

command -nargs=1 Ag call s:Ag(<q-args>)
nnoremap \ :Ag <C-R>=expand("<cword>")<CR><CR>
" }}}

" | Ctags integration | "C-]" | {{{
command! -nargs=* -complete=tag Tags call s:Tags(<q-args>)

function! s:Tags(name)
  " Retrieve tags of the 'f' kind
  let tags = taglist('^'.a:name.'$')

  " Prepare them for inserting in the quickfix window
  let qf_taglist = []
  for entry in tags
    call add(qf_taglist, {
          \ 'text':  entry['name'],
          \ 'filename': entry['filename'],
          \ 'lnum': entry['line'],
          \ })
  endfor

  " Place the tags in the quickfix window, if possible
  if len(qf_taglist) > 0
    call setqflist(qf_taglist)
    copen
  else
    echo "No tags found for ".a:name
  endif
endfunction
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
