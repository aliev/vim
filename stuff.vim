" {{{ Airline
let g:airline_powerline_fonts = 1 " Use airline fonts
" If you want to auto-completion to work stable in older vim, disable this option
let g:airline#extensions#tabline#enabled = 1
" Airline tabs settings
let g:airline#extensions#tabline#fnamemod = ':t'
" Airline symbol for modified buffers
let g:airline_symbols={'modified': nr2char(0xE0B7)}
" }}}

" {{{ Jedi-vim
" Disabple showing function call signature
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0

" let's this deals vim-python-ftplugin module
let g:jedi#popup_on_dot = 0
" }}}

"{{{ vim-python-mode 

" disable syntax checking
" because we use syntastic
let g:python_check_syntax=0
" Do not autocomplete after from statement
let g:python_auto_complete_modules=0
" Enable autocomplete after pressing dot or import
let g:python_auto_complete_variables=1
"}}}

" {{{ NERDTree
let g:NERDTreeMinimalUI=1
let NERDTreeIgnore = ['\.pyc$']
let g:UltiSnipsJumpForwardTrigger='<tab>'
" }}}

" {{{ Indent-line
" Make indent line faster
let g:indentLine_faster=1
" IndentLine character
" For use this feature please install patched font from repository root
let g:indentLine_char=nr2char(0xE0A3)
" }}}

" {{{ Signify
" Signify characters
let g:signify_sign_add=nr2char(0xE0B9)
let g:signify_sign_delete=nr2char(0xE0BA)
let g:signify_sign_delete_first_line=nr2char(0xE0BB)
let g:signify_sign_change=nr2char(0xE0BD)
" }}}

" {{{ Color options
" Signify colors
hi SignifySignAdd guibg=#4e4e4e ctermbg=NONE
hi SignifySignChange guibg=#4e4e4e ctermbg=NONE
hi SignifySignDelete guibg=#4e4e4e ctermbg=NONE
hi SignifySignChangeDelete guibg=#4e4e4e ctermbg=NONE

hi SignColumn ctermbg=NONE guibg=NONE
hi FoldColumn ctermbg=NONE guibg=NONE

highlight SpellBad cterm=NONE ctermfg=NONE ctermbg=NONE
highlight SpellCap cterm=NONE ctermfg=NONE ctermbg=NONE

hi SyntasticError ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
hi SyntasticErrorSign ctermbg=NONE ctermfg=181 guibg=NONE guifg=red
hi SyntasticWarningSign ctermbg=NONE ctermfg=214 guibg=NONE
" Disable background and foreground for vertical split
hi vertsplit ctermbg=NONE guibg=NONE

" }}}

" {{{ Syntastic
" Syntax check mode for python (pip install pylama)
let g:syntastic_python_checkers = ['pylama']

" Syntax check mode for javascript (npm install jslint)
let g:syntastic_javascript_checkers = ['jslint']

" Make syntastic auto update the location list and make it also check
" when the file opens
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1

" Syntastic signs (disabled by default)
let g:syntastic_enable_signs=1

" Syntastic signs icons
let g:syntastic_error_symbol = nr2char(0xE0BB)
let g:syntastic_style_error_symbol = nr2char(0xE0BB)

let g:syntastic_warning_symbol = nr2char(0xE0BE)
let g:syntastic_style_warning_symbol = nr2char(0xE0BE)
" }}}

" {{{ Keymaps
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>s :CtrlPBufTag<cr>

" Comment selected line
map <leader>/ :TComment<CR>

" File autocomplte
imap <leader>f <c-x><c-f>

" Default autocomplete
imap <leader>c <c-x><c-o>

" Show/hide trail characters
nmap <leader>l :set list!<CR>

" Close buffer with ask save it
nnoremap <leader>w :confirm :Bclose<CR>

nnoremap <leader>e :NERDTreeToggle<CR>

" T-Comment keymap
let g:tcommentMapLeader2 = '<leader>/'
" }}}

" Required for vim-python-pep8-indent
let g:pymode_indent = 0

" Add the virtualenv's site-packages to vim path {{{
if has("python")
py << EOF
import os.path
import sys
import vim

if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))

#add the pwd to sys path as it is not appearing in
sys.path.insert(0,os.getcwd())
EOF

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif
endif
" }}}
