" | FileType options | {{{
if has("autocmd")
  " Python indentation
  " About nosmartindent please look this link
  " http://stackoverflow.com/questions/2063175/vim-insert-mode-comments-go-to-start-of-line
  au FileType python setl nosmartindent

  " JavaScript indentation
  au FileType javascript setlocal expandtab shiftwidth=2 tabstop=2

  " Vim indentation
  au FileType vim setlocal expandtab shiftwidth=2 tabstop=2

  " Disable line numbers for QuickFix
  au FileType qf setlocal nonumber
endif
" }}}

" | Very simple statusline like airline | {{{

let g:currentmode={
      \ 'n'  : 'N ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'V ',
      \ 'V'  : 'V·Line ',
      \ '' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ '' : 'S·Block ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

function! VirtualEnv()
  let virtualenv = $VIRTUAL_ENV
  if virtualenv != ''
    let env = join(split($VIRTUAL_ENV, '/')[-2:-1], '/')
    return '(' . env . ')'
  else
    return ''
  endif
endfunction

set laststatus=2
set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=\ %{GitInfo()}                        " Git Branch name
set statusline+=\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}             " Syntastic errors
set statusline+=%*
set statusline+=\ %=                                  " Space
set statusline+=\ %y\                                 " FileType
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%{VirtualEnv()}                       " Virtualenv
" }}}

" | jedi-vim | {{{
let g:jedi#popup_on_dot = 1

let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#smart_auto_mappings = 0
" }}}

" | ultisnips | {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" }}}

" | indentLine | {{{
" Make indent line faster
let g:indentLine_faster=1
" IndentLine character
let g:indentLine_char=nr2char(0xA6)
" }}}

" | vim-htmldjango_omnicomplete | {{{
if has("autocmd")
  au FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango
endif
" }}}

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

" | vim-gitgutter | {{{
let g:gitgutter_max_signs=500
" }}}

" | :<tab> shows command list from fzf | {{{
set wildcharm=<Tab>
cnoremap <expr><tab> getcmdpos()>1?"\<Tab>":"Commands<CR>"
" }}}

" | Goto file with line number under cursor | gf | {{{
nnoremap gf gF
" }}}

" | Move visual block up or down | J, K | {{{
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
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

" | Color options | {{{
try
  set background=dark
  let base16colorspace=256
  colors base16-eighties
catch
endtry

" Disable background and foreground for vertical split
hi vertsplit ctermbg=NONE guibg=NONE
hi StatusLine ctermbg=18 ctermfg=15
hi StatusLineNC ctermbg=18 ctermfg=8
" }}}

" vim:foldmethod=marker:foldlevel=0
