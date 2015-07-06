" Plugins options

set rtp+=~/.fzf

" Airline
let g:airline_powerline_fonts = 1 " Use airline fonts
" If you want to auto-completion to work stable in older vim, disable this option
let g:airline#extensions#tabline#enabled = 1
" Airline tabline settings
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Jedi-vim
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 1

" Indent-line
" Make indent line faster
let g:indentLine_faster=1
" IndentLine character For use this feature please install patched font from repository root
let g:indentLine_char=nr2char(0xE0A3)

" Required for vim-python-pep8-indent
let g:pymode_indent = 0
" UltiSnips
let g:UltiSnipsJumpForwardTrigger='<tab>'

" Color options

colors lucius " Color scheme

" Disable colors for folding column
hi FoldColumn ctermbg=NONE guibg=NONE

" Sign colors
hi! link SignColumn FoldColumn
" Disable background and foreground for vertical split
hi vertsplit ctermbg=NONE guibg=NONE
hi! link Folded ColorColumn
hi! link Error SpellBad

" Syntastic options
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

let g:webdevicons_enable_nerdtree = 0
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$']

let g:gitgutter_max_signs=10000

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let [key, line] = a:lines[0:1]
  let [file, line, col] = split(line, ':')[0:2]
  let cmd = get({'ctrl-x': 'split', 'ctrl-v': 'vertical split', 'ctrl-t': 'tabe'}, key, 'e')
  execute cmd escape(file, ' %#\')
  execute line
  execute 'normal!' col.'|zz'
endfunction

command! -nargs=1 Ag call fzf#run({
\ 'source':  'ag --nogroup --column --color "'.escape(<q-args>, '"\').'"',
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --no-multi --color hl:68,hl+:110',
\ 'down':    '50%'
\ })
