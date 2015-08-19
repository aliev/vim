" | vim-python-pep8-indent | {{{
" Disable default Python indentation
" Required for vim-python-pep8-indent
let g:pymode_indent = 0
" }}}

" | vim-airline | {{{
let g:airline_powerline_fonts = 1 " Use airline fonts
" If you want to auto-completion to work stable in older vim, disable this option
let g:airline#extensions#tabline#enabled = 1
" Airline tabline settings
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_c = '%t'
" }}}

" | vim-togglecursor | {{{
let g:togglecursor_default = 'block'
let g:togglecursor_insert = 'blinking_line'
" }}}

" | jedi-vim | {{{
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 1
let g:jedi#smart_auto_mappings = 0
" }}}

" | indentLine | {{{
" Make indent line faster
let g:indentLine_faster=1
" IndentLine character For use this feature please install patched font from repository root
let g:indentLine_char=nr2char(0xE0B4)
" }}}

" | vim-devicons | {{{
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" }}}

" | syntastic | {{{
" Syntax check mode for python (pip install pylama)
let g:syntastic_python_checkers = ['flake8']

" Syntax check mode for javascript (npm install jslint)
let g:syntastic_javascript_checkers = ['jslint']

" Make syntastic auto update the location list and make it also check
" when the file opens
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0
" }}}

" | nerdtree | leader+e, leader+E{{{
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$']

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
nnoremap <silent> <Leader>E :NERDTreeFind<CR>
" }}}

" | ultisnips | {{{
let g:UltiSnipsJumpForwardTrigger='<tab>'
" }}}

" | incsearch.vim | / ? g/ | {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}

" | vim-gitgutter | {{{
let g:gitgutter_max_signs=10000

silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif
" }}}

" | Goto file with line number under cursor | gf | {{{
nnoremap gf gF
" }}}

" | List toggle | leader+l | {{{
nnoremap <silent> <Leader>l :set list!<CR>
" }}}

" | Close buffer with ask save it | leader+w | {{{
nnoremap <silent> <Leader>w :confirm :Bclose<CR>
" }}}

" | Silver searcher | :Ag | {{{
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x '.
\            '--multi --bind ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })
" }}}

" | Quickly jump by declarations list | leader+s |{{{
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --fields=nKs --excmd=number --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
    execute split(a:line, "\t")[2]
    sil! norm! zvzz
endfunction

function! s:btags()
  try
    call fzf#run({'source':  s:btags_source(),
                 \'down':    '50%',
                 \'options': '+m -d "\t" --with-nth 1,4,5 -n 1 --tiebreak=index',
                 \'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()

nnoremap <silent> <Leader>s :BTags<CR>
" }}}

" | Buffer list | leader+b | {{{
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
" }}}

" | Open files in splits | leader+f, leader+v | {{{
" Open files
nnoremap <silent> <Leader>f :call fzf#run({
\   'down': '40%',
\   'sink': 'e' })<CR>

nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>
" }}}

" | MRU search | :FZFMru | {{{
command! FZFMru call fzf#run({
            \'source': v:oldfiles,
            \'sink' : 'e ',
            \'options' : '-m',
            \})

function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction
" }}}

" | Search lines in all open vim buffers | :FZFLines | {{{
function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})
" }}}

" | Search word under cursor by using Ag | leader + a | {{{
noremap <silent><Leader>a :Ag <C-R>=expand("<cword>")<CR><CR>
" }}}

" | Color options | {{{
colors lucius " Color scheme

" Disable colors for folding column
hi FoldColumn ctermbg=NONE guibg=NONE

" Sign colors
hi! link SignColumn FoldColumn
" Disable background and foreground for vertical split
hi vertsplit ctermbg=NONE guibg=NONE
hi! link Folded ColorColumn
hi! link Error SpellBad
" }}}

" vim:foldmethod=marker:foldlevel=0
