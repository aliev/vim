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

" | vim-airline | {{{
let g:airline_powerline_fonts = 1 " Use airline fonts

if v:version >= 703
  let g:airline#extensions#tabline#enabled = 1
endif

" Define the shortform set of text to display
" for each mode
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n' : 'N',
  \ 'i' : 'I',
  \ 'R' : 'R',
  \ 'c' : 'C',
  \ 'v' : 'V',
  \ 'V' : 'V',
  \ '' : 'V',
  \ 's' : 'S',
  \ 'S' : 'S',
  \ '' : 'S',
  \ }

" Airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_section_z = airline#section#create_right(['%{g:airline_symbols.linenr}% %3l:%2c'])

" Airline tabline settings
let g:airline#extensions#tabline#fnamemod = ':t'

" }}}

" | syntastic | {{{
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_enable_signs = 0
" }}}

" | jedi-vim | {{{
let g:jedi#popup_on_dot = 1

let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#smart_auto_mappings = 0
" }}}

" | vim-togglecursor | {{{
let g:togglecursor_default="block"
let g:togglecursor_insert="line"
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
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = nr2char(0xE5FF)
let g:NERDTreeDirArrowCollapsible = nr2char(0xE5FE)
let NERDTreeIgnore = ['\.pyc$']

" Oh, I Love It!
let g:NERDTreeHijackNetrw = 1
nnoremap <silent> <leader>e :execute 'e '. expand('%:p:h')<CR>
" }}}

" | vim-gitgutter | {{{
let g:gitgutter_max_signs=500
" }}}

" | Commands List | <leader>: | {{{
" Show Commands <leader>,
nnoremap <leader>: :Commands<CR>
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

" | Give directory for current file and open command mode | <leader>. | {{{
nnoremap <leader>. <Esc>: <C-R>=expand("%:p:h") . "/" <CR><Home>
" }}}

" | Switch between the last edited two files | <leader><leader> {{{
nnoremap <leader><leader> <c-^>
" }}}

" | Search word under cursor by using Ag | <leader>ag | {{{
noremap <silent><Leader>ag :Ag <C-R>=expand("<cword>")<CR><CR>
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
" }}}

" vim:foldmethod=marker:foldlevel=0
