" Very simple statusline like vim-airline

let g:currentmode={
      \ 'n'  : 'N ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'V ',
      \ 'V'  : 'V·Line ',
      \ '' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ '' : 'S·Block ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

function! VirtualEnv()
  let virtualenv = $VIRTUAL_ENV
  if virtualenv != ''
    let env = join(split($VIRTUAL_ENV, '/')[-2:-1], '/')
    return '(' . env . ')'
  else
    return ''
  endif
endfunction

set laststatus=2
set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=\ %{GitInfo()}                        " Git Branch name
set statusline+=\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%*
set statusline+=\ %=                                  " Space
set statusline+=\ %y\                                 " FileType
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%{VirtualEnv()}                       " Virtualenv

" vim:foldmethod=marker:foldlevel=0
