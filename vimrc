" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

Plug 'aliev/vimrc'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'

Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'gavocanov/vim-js-indent', {'for': ['javascript', 'javascript.jsx']}
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'

" Initialize plugin system
call plug#end()

set wildignore+=env/**
let mapleader=','
let mapleaderlocal='\'

set showtabline=2

if has('gui')
  set guifont=Source\ Code\ Pro:h14
  set bg=light
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

    " Automatically remove unwanted spaces
    au BufWritePre * %s/\s\+$//e
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
" List of tags
nnoremap <leader>s :LeaderfBufTag<CR>
"
" Go to definition
nnoremap <leader>d :YcmCompleter GoTo<CR>
"
" Remove trailing whitespaces
nnoremap <silent><LocalLeader>w :%s/\s\+$//<cr>:let @/=''<cr>
"
" Find merge conflicts
map <LocalLeader>c /\v^[<\|=>]{7}( .*\|$)<CR>
"
" Grepper
nnoremap <LocalLeader>g :Grepper -tool ag -cword -noprompt<cr>

command! Todo :Grepper
      \ -noprompt
      \ -tool git
      \ -grepprg git grep -nIi '\(TODO\|FIXME\)'

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
  return printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return printf('%d ✗', all_errors)
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

let g:grepper = {}
let g:grepper.tools = ['git', 'ag', 'grep']
let g:grepper.jump = 0
let g:grepper.open = 1

let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_autotags = "th,td,tr,tfoot,thead"
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

let g:NERDTreeMinimalUI = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeQuitOnOpen = 0

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
      \   'python': ['flake8'],
      \}
let g:ale_statusline_format = ['E%d', 'W%d', '']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_signs = 1
let g:ale_set_highlights = 0
let g:ale_sign_warning = '◆'
let g:ale_sign_error = '◆'

let g:buftabline_show = 2
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

let g:Lf_CursorBlink = 0
let g:Lf_PreviewResult = { 'BufTag': 0 }
let g:Lf_CommandMap = {'<C-C>': ['<Esc>']}
let g:Lf_DefaultMode = 'FullPath'

let g:lightline = {
      \ 'active': {
      \  'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'gitgutter', 'readonly', 'relativepath', 'modified' ] ],
      \ 'right': [ [ 'lineinfo', 'syntastic' ],
      \            [ 'percent' ],
      \            [ 'readonly', 'linter_warnings', 'linter_errors', ],
      \            [ 'fileformat', 'fileencoding', 'filetype', 'tagbar' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
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
      \ 'separator': { 'left': '►', 'right': '◄' },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

let g:lightline.inactive = {
      \ 'left': [ [ 'absolutepath' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ] }

let g:lightline.colorscheme = 'Tomorrow_Night_Eighties'

highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" vim:ft=vim:foldmethod=marker:foldlevel=0
