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
let g:jedi#popup_select_first=0
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

" {{{ Signify
" Signify characters
let g:signify_sign_add=nr2char(0xE0B9)
let g:signify_sign_delete=nr2char(0xE0BA)
let g:signify_sign_delete_first_line=nr2char(0xE0BB)
let g:signify_sign_change=nr2char(0xE0BD)
" }}}

" Required for vim-python-pep8-indent
let g:pymode_indent = 0
" UltiSnips
let g:UltiSnipsJumpForwardTrigger='<tab>'

" }}}

" {{{ Color options

" Disable colors for folding column
hi FoldColumn ctermbg=NONE guibg=NONE

" Signify colors

hi! link SignifySignAdd FoldColumn
hi! link SignifySignChange FoldColumn
hi! link SignifySignDelete FoldColumn
hi! link SignifySignChangeDelete FoldCoumn

hi! link SignColumn FoldColumn

" Disable background and foreground for vertical split
hi vertsplit ctermbg=NONE guibg=NONE

hi! link Folded ColorColumn

" Syntastic options {{{
" Syntax check mode for python (pip install pylama)
let g:syntastic_python_checkers = ['pylama']

" Syntax check mode for javascript (npm install jslint)
let g:syntastic_javascript_checkers = ['jslint']

" Make syntastic auto update the location list and make it also check
" when the file opens
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1

if has('gui_running')
    let g:syntastic_enable_signs=0
    hi! link Error SpellBad
else
    " Enable signs for not gui vim
    let g:syntastic_enable_signs=1

    " Show icons for error and warning symbols
    let g:syntastic_error_symbol = nr2char(0xE0BB)
    let g:syntastic_style_error_symbol = nr2char(0xE0BB)
    let g:syntastic_warning_symbol = nr2char(0xE0BE)
    let g:syntastic_style_warning_symbol = nr2char(0xE0BE)
    
    hi SyntasticWarningSign ctermbg=NONE ctermfg=187
    hi SyntasticStyleWarningSign ctermbg=NONE ctermfg=187
    hi SyntasticErrorSign ctermbg=NONE ctermfg=181
    hi SyntasticStyleErrorSign ctermbg=NONE ctermfg=181

    hi SyntasticStyleError ctermbg=NONE ctermfg=NONE
    hi SyntasticError ctermbg=NONE ctermfg=NONE
    hi SyntasticWarning ctermbg=NONE ctermfg=NONE
endif
" }}}
