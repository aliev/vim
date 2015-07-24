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

" ----------------------------------------------------------------------------
" BTags
" ----------------------------------------------------------------------------
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
    \ 'ctags -f - --sort=no --fields=nKs --excmd=pattern --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  let lines = split(a:line, "\t")
  for line in lines
      let arr = split(line, ":")
      if arr[0] == "line"
          exec arr[-1]
      endif
  endfor
  sil! norm! zvzz
endfunction

function! s:btags()
  try
    call fzf#run({'source':  s:btags_source(),
                 \'down':    '50%',
                 \'options': '+m -d "\t" --with-nth 4,1',
                 \'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()

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

cnoremap <silent> <c-l> <c-\>eGetCompletions()<cr>
"add an extra <cr> at the end of this line to automatically accept the fzf-selected completions.

function! Lister()
    call extend(g:FZF_Cmd_Completion_Pre_List,split(getcmdline(),'\(\\\zs\)\@<!\& '))
endfunction

function! CmdLineDirComplete(prefix, options, rawdir)
    let l:dirprefix = matchstr(a:rawdir,"^.*/")
    if isdirectory(expand(l:dirprefix))
        return join(a:prefix + map(fzf#run({
                    \'options': a:options . ' --select-1  --query=' .
                    \ a:rawdir[matchend(a:rawdir,"^.*/"):len(a:rawdir)], 
                    \'dir': expand(l:dirprefix)
                    \}), 
                    \'"' . escape(l:dirprefix, " ") . '" . escape(v:val, " ")'))
    else
        return join(a:prefix + map(fzf#run({
                    \'options': a:options . ' --query='. a:rawdir }),
                    \'escape(v:val, " ")')) 
        "dropped --select-1 to speed things up on a long query
endfunction

function! GetCompletions()
    let g:FZF_Cmd_Completion_Pre_List = []
    let l:cmdline_list = split(getcmdline(), '\(\\\zs\)\@<!\& ', 1)
    let l:Prefix = l:cmdline_list[0:-2]
    execute "silent normal! :" . getcmdline() . "\<c-a>\<c-\>eLister()\<cr>\<c-c>"
    let l:FZF_Cmd_Completion_List = g:FZF_Cmd_Completion_Pre_List[len(l:Prefix):-1]
    unlet g:FZF_Cmd_Completion_Pre_List
    if len(l:Prefix) > 0 && l:Prefix[0] =~
                \ '^ed\=i\=t\=$\|^spl\=i\=t\=$\|^tabed\=i\=t\=$\|^arged\=i\=t\=$\|^vsp\=l\=i\=t\=$'
                "single-argument file commands
        return CmdLineDirComplete(l:Prefix, "",l:cmdline_list[-1])
    elseif len(l:Prefix) > 0 && l:Prefix[0] =~ 
                \ '^arg\=s\=$\|^ne\=x\=t\=$\|^sne\=x\=t\=$\|^argad\=d\=$'  
                "multi-argument file commands
        return CmdLineDirComplete(l:Prefix, '--multi', l:cmdline_list[-1])
    else 
        return join(l:Prefix + fzf#run({
                    \'source':l:FZF_Cmd_Completion_List, 
                    \'options': '--select-1 --query='.shellescape(l:cmdline_list[-1])
                    \})) 
    endif
endfunction

" Open files in horizontal split
nnoremap <silent> <Leader>f :call fzf#run({
\   'down': '40%',
\   'sink': 'e' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>
