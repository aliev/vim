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

function! Bufferline()
  call bufferline#refresh_status()
  let b = g:bufferline_status_info.before
  let c = g:bufferline_status_info.current
  let a = g:bufferline_status_info.after
  let alen = strlen(a)
  let blen = strlen(b)
  let clen = strlen(c)
  let w = winwidth(0) * 4 / 9
  if w < alen+blen+clen
    let whalf = (w - strlen(c)) / 2
    let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
    let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
    return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
  else
    return b . c . a
  endif
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
set statusline+=\ %{Bufferline()}
set statusline+=%*
set statusline+=\ %=                                  " Space
set statusline+=\ %y\                                 " FileType
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%{VirtualEnv()}                       " Virtualenv

" vim:foldmethod=marker:foldlevel=0
