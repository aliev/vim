execute pathogen#infect()
syntax on
filetype plugin indent on

set wildignore+=env/**
let mapleader=','
let mapleaderlocal='\'
set guifont=Fira\ Code\ Retina:h14
colo peachpuff

if has("autocmd")
  augroup local
    au!
    " JavaScript indentation
    au FileType javascript setl expandtab shiftwidth=2 tabstop=2
    au FileType javascript.jsx setl expandtab shiftwidth=2 tabstop=2

    " Vim indentation
    au FileType vim setl foldenable expandtab shiftwidth=2 tabstop=2

    " Disable line numbers for QuickFix
    au FileType qf setl nonumber

    au FileType gitrebase map s :2,$s/^pick/squash/<CR>

    " Automatically remove unwanted spaces
    au BufWritePre * %s/\s\+$//e

    au BufWritePost * GitGutter
  augroup END
endif

" Clear highlighting
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
"
" Visually select the text that was last edited/pasted
noremap gV `[v`]
"
" Move visual block
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
"
" Goto file with line number under cursor
nnoremap gf gF
"
" Let's remove this annoying :W
cnoremap W w
"
" Kill the current buffer and move to the previous one | "<leader>w"
nnoremap <silent><leader>w :bp <BAR> bd #<CR>
"
" Buffers
nnoremap <leader><leader> <C-^>
nnoremap > :bn<CR>
nnoremap < :bp<CR>
"
" Keep selection after in/outdent
vnoremap < <gv
vnoremap > >gv
"
" Keep search matches in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
"
" Buffers
nnoremap <silent><leader>b :CtrlPBuffer<CR>
"
" Tags
nnoremap <silent><leader>s :CtrlPBufTagAll<CR>
"
" Grep helper
nnoremap <LocalLeader>g :silent grep! '<C-R>=expand("<cword>")<CR>' \| copen<s-left><s-left><left><left>
"
" Find merge conflicts
map <LocalLeader>c /\v^[<\|=>]{7}( .*\|$)<CR>

function! Nerdtree()
  let l:is_nerdtree = expand('%') =~# 'NERD_tree'
  let l:is_cur_buf_empty = empty(expand("%"))

  if l:is_nerdtree || l:is_cur_buf_empty
    execute 'NERDTreeToggle'
  else
    execute 'NERDTreeFind'
  endif
endfunction

if empty(maparg('-', 'n'))
  nmap <silent>- :call Nerdtree()<CR>
endif

let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_autotags = "th,td,tr,tfoot,thead"
let g:xml_syntax_folding = 0

let g:NERDTreeMinimalUI = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeQuitOnOpen = 0

let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'javascript.jsx': ['eslint'],
      \   'python': ['pylint', 'flake8'],
      \}
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \}
let g:ale_fix_on_save = 1
let g:ale_statusline_format = ['E%d', 'W%d', '']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_signs = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'

let g:buftabline_show = 2
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

let g:tagbar_silent = 1

let g:ctrlp_map = '<leader>f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|env'

function! Gitgutter()
  let symbols = ['+', '-', '~']
  let [added, modified, removed] = gitgutter#hunk#summary(winbufnr(0))
  let stats = [added, removed, modified]  " reorder
  let hunkline = ''

  for i in range(3)
    if stats[i] > 0
      let hunkline .= printf('%s%s ', symbols[i], stats[i])
    endif
  endfor

  if !empty(hunkline)
    let hunkline = printf('%s', hunkline[:-2])
  endif

  return hunkline
endfunction

function! Fugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? branch : ''
  endif
  return ''
endfunction

function! s:statusline_expr()
  let fug = "%{exists('g:loaded_fugitive') ? Fugitive() : ''}"
  let git = " %{Gitgutter()} "
  let fn  = "%f%{tagbar#currenttag(':%s','','f')}"
  let mod = "%{&modified ? '[+] ' : ''}"
  let ro  = "%{&readonly ? 'RO' : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '

  return '[%n] %<'.fug.git.fn.mod.ro.sep.pos
endfunction

let &statusline = s:statusline_expr()

hi ALEErrorSign guibg=NONE
hi ALEWarningSign guibg=NONE
