set wildignore+=env/**
let mapleader=','
let mapleaderlocal='\'

set showtabline=2

if has('gui')
  colo gruvbox
  set guifont=Source\ Code\ Pro:h14
  set bg=light
endif

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if has("autocmd")
  augroup local
    au!
    " JavaScript indentation
    au FileType javascript setl expandtab shiftwidth=2 tabstop=2

    " Vim indentation
    au FileType vim setl foldenable expandtab shiftwidth=2 tabstop=2

    " Disable line numbers for QuickFix
    au FileType qf setl nonumber

    au FileType gitrebase map s :2,$s/^pick/squash/<CR>

    au User ALELint call lightline#update()
  augroup END
endif

" Clear highlighting
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Visually select the text that was last edited/pasted
noremap gV `[v`]

" Move visual block
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

cnoremap <LocalLeader><LocalLeader> <C-R>=fugitive#head()<CR>

" Goto file with line number under cursor
nnoremap gf gF

" Kill the current buffer and move to the previous one | "<leader>w"
nnoremap <silent><leader>w :bp <BAR> bd #<CR>

" Buffers
nnoremap <leader><leader> <C-^>
nnoremap > :bn<CR>
nnoremap < :bp<CR>

" Keep selection after in/outdent
vnoremap < <gv
vnoremap > >gv

" Keep search matches in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
"
" List of tags
nnoremap <leader>s :CtrlPBufTag<CR>
"
" List of buffers
nnoremap <leader>b :CtrlPBuffer<CR>
"
" Go to tag
nnoremap <leader>t :CtrlPTag<CR>
"
" Go to definition
nnoremap <leader>d :YcmCompleter GoTo<CR>
"
" Remove trailing whitespaces
nnoremap <silent><LocalLeader>w :%s/\s\+$//<cr>:let @/=''<cr>
"
" Git find/grep
map <silent><LocalLeader>g :silent grep! <C-R>=expand("<cword>")<CR><CR>:redraw!<CR><CR>:copen<CR>
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

let g:jsx_ext_required = 0

" NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeQuitOnOpen = 0

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

let python_highlight_all = 1

let g:tagbar_silent = 1

let g:ycm_key_invoke_completion = '<C-c>'

" npm install -g eslint
" npm install -g babel-eslint
" npm install -g eslint-plugin-react
" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'javascript.jsx': ['eslint'],
      \   'python': ['pylint', 'flake8'],
      \}
let g:ale_statusline_format = ['E%d', 'W%d', '']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_signs = 1
let g:ale_set_highlights = 0
let g:ale_sign_warning = '◆'
let g:ale_sign_error = '◆'

highlight link ALEWarningSign String
highlight link ALEErrorSign Title

let g:buftabline_show = 2
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

if isdirectory('.git') && executable('git')
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
else
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_buftag_types = { 'javascript': '--language-force=javascript --javascript-types=fcmv' }

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

function! Tagbar()
  return tagbar#currenttag('%s','','f')
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! GetFileName(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = expand('#'.buflist[winnr - 1].":~:.")
  return _ !=# '' ? _ : '[No Name]'
endfunction


let g:lightline = {}

let g:lightline.enable = {
      \ 'statusline': 1,
      \ }

let g:lightline = {
      \ 'active': {
      \  'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'gitgutter', 'readonly', 'relativepath', 'modified' ] ],
      \ 'right': [ [ 'lineinfo', 'syntastic' ],
      \            [ 'percent' ],
      \            [ 'readonly', 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \            [ 'fileformat', 'fileencoding', 'filetype', 'tagbar' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineFugitive',
      \   'gitgutter': 'Gitgutter',
      \   'tagbar': 'Tagbar',
      \   'readonly': 'LightlineReadonly',
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

let g:lightline.inactive = {
      \ 'left': [ [ 'absolutepath' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ] }

" vim:ft=vim:foldmethod=marker:foldlevel=0
