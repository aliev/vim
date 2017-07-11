set wildignore+=env/**
let mapleader=','
let mapleaderlocal='\'

colo PaperColor

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
nnoremap <leader>b :call setqflist(map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), '{"bufnr": v:val}'))<CR>:copen<CR>
"
" Remove trailing whitespaces
nnoremap <silent><LocalLeader>w :%s/\s\+$//<cr>:let @/=''<cr>
"
" Git find/grep
map <LocalLeader>g :GrepperGit <C-R>=expand("<cword>")<CR>
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

if isdirectory('.git') && executable('git')
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
else
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_buftag_types = { 'javascript': '--language-force=javascript --javascript-types=fcmv' }

let g:grepper = {}
let g:grepper.tools = ['ag', 'git']
let g:tagbar_silent = 1

let g:completor_blacklist = ['tagbar', 'qf', 'netrw', 'unite', 'vimwiki', 'gitcommit']
let g:completor_filetype_map = {"javascript.jsx": "javascript"}
let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'

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
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_set_signs = 1
let g:ale_set_highlights = 0

let g:buftabline_show = 2
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1


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

  return hunkline . ' '
endfunction

function! s:TList(name)
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

command! -nargs=1 -complete=tag TList call s:TList(<f-args>)

set statusline+=\ %{exists('g:loaded_fugitive')?fugitive#head():''}%*
set statusline+=\ %{exists('g:loaded_gitgutter')?Gitgutter():''}%*
set statusline+=\ %f\ %*
set statusline+=\ %{exists('g:virtualenv_loaded')?virtualenv#statusline():''}%*
set statusline+=%=\ %{&ff}
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}
set statusline+=\ %{(&bomb?\",BOM\":\"\")}
set statusline+=\ %{tagbar#currenttag('%s','','f')}%*
set statusline+=\ %{exists('g:loaded_ale')?ALEGetStatusLine():''}
set statusline+=\ %{grepper#statusline()}%*

" vim:ft=vim:foldmethod=marker:foldlevel=0
