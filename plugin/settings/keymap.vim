" | nerdtree | - | {{{
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeDirArrowExpandable = nr2char(0xF07b)
let g:NERDTreeDirArrowCollapsible = nr2char(0xF07c)

" Oh, I Love It! Taken from vim-vinegar
" but needed some refactoring
function! s:up_or_edit()
  if empty(expand('%'))
    execute 'silent edit .'
  else
    execute 'silent edit %:h/'
  endif
endfunction

nnoremap <silent> <Plug>Up :call <SID>up_or_edit()<CR>
if empty(maparg('-', 'n'))
  nmap - <Plug>Up
endif
nmap <buffer> - <Plug>Up
" }}}

" | Find merge conflict markers | <leader>c | {{{
map <leader>c /\v^[<\|=>]{7}( .*\|$)<CR>
" }}}

" | :<tab> shows command list from fzf | {{{
set wildcharm=<Tab>
cnoremap <expr><tab> getcmdpos()>1?"\<Tab>":"Commands<CR>"
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

" | Commenting blocks of code. | for comment: <leader>cc for uncomment: <leader>cu {{{
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
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

" vim:foldmethod=marker:foldlevel=0
