" Plugins options

" {{{ Plugins options
" {{{ Airline
let g:airline_powerline_fonts = 1 " Use airline fonts
" If you want to auto-completion to work stable in older vim, disable this option
let g:airline#extensions#tabline#enabled = 1
" Airline tabline settings
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
" }}}

" {{{ Jedi-vim
" Disabple showing function call signature
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 1
" }}}

" {{{ NERDTree
let g:NERDTreeMinimalUI=1
let NERDTreeIgnore = ['\.pyc$']
" }}}

" {{{ Indent-line
" Make indent line faster
let g:indentLine_faster=1
" IndentLine character For use this feature please install patched font from repository root
let g:indentLine_char=nr2char(0xE0A3)
" }}}

" Required for vim-python-pep8-indent
let g:pymode_indent = 0
" UltiSnips
let g:UltiSnipsJumpForwardTrigger='<tab>'

" }}}

" {{{ Color options

" Disable colors for folding column
hi FoldColumn ctermbg=NONE guibg=NONE

" Sign colors
hi! link SignColumn FoldColumn
" Disable background and foreground for vertical split
hi vertsplit ctermbg=NONE guibg=NONE
hi! link Folded ColorColumn
hi! link Error SpellBad

" Syntastic options {{{
" Syntax check mode for python (pip install pylama)
let g:syntastic_python_checkers = ['flake8']

" Syntax check mode for javascript (npm install jslint)
let g:syntastic_javascript_checkers = ['jslint']

" Make syntastic auto update the location list and make it also check
" when the file opens
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0

let g:airline_section_c = '%t'
