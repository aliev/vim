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
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/vim-jsx-improve'
Plug 'romainl/apprentice'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

set wildignore+=env/**
let mapleader=','
let mapleaderlocal='\'

set showtabline=2

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[0 q"

if has('gui')
  let g:gruvbox_contrast_light = 'soft'
  colo gruvbox
  set guifont=Fira\ Code\ Light:h14
endif

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
" Go to definition
nnoremap <leader>d :YcmCompleter GoTo<CR>
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
  return printf('w %d', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return printf('e %d', all_errors)
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

let g:ycm_key_invoke_completion = '<C-c>'
let g:ycm_python_binary_path = 'python'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

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
let g:ale_sign_warning = 'w'
let g:ale_sign_error = 'e'

let g:buftabline_show = 2
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

let g:Lf_CursorBlink = 0
let g:Lf_PreviewResult = { 'BufTag': 0 }
let g:Lf_CommandMap = {'<C-C>': ['<Esc>']}
let g:Lf_DefaultMode = 'FullPath'

let g:jsx_ext_required = 0
let python_highlight_all = 1
let g:tagbar_silent = 1

let g:ctrlp_map = '<leader>f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

let g:lightline = {}

let g:lightline.component_type = {
    \   'readonly': 'error',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error'
    \ }

let g:lightline.component_function = {
    \   'gitbranch': 'LightlineFugitive',
    \   'gitgutter': 'Gitgutter',
    \   'tagbar': 'Tagbar',
    \   'readonly': 'LightlineReadonly',
    \ }

let g:lightline.component_expand = {
    \   'linter_warnings': 'LightlineLinterWarnings',
    \   'linter_errors': 'LightlineLinterErrors',
    \ }

let g:lightline.component = {
      \   'lineinfo': ' %3l:%-2v'
      \ }

let g:lightline.active = {
      \  'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'gitgutter', 'readonly', 'relativepath', 'modified' ] ],
      \ 'right': [ [ 'lineinfo', 'syntastic' ],
      \            [ 'percent' ],
      \            [ 'readonly', 'linter_warnings', 'linter_errors', ],
      \            [ 'fileformat', 'fileencoding', 'filetype', 'tagbar' ] ]
      \ }

let g:lightline.inactive = {
      \ 'left': [ [ 'absolutepath' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ] }

let g:lightline.colorscheme = 'gruvbox'

" vim:ft=vim:foldmethod=marker:foldlevel=0
