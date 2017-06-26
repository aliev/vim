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

set statusline+=\ %{exists('g:loaded_fugitive')?fugitive#head():''}%*
set statusline+=%{exists('g:loaded_gitgutter')?Gitgutter():''}%*
set statusline+=\ %f\ %*
set statusline+=%=\ %{&ff}\ \|
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}\ \|
set statusline+=\ %{(&bomb?\",BOM\":\"\")}
set statusline+=\ %{tagbar#currenttag('%s','','f')}%*
set statusline+=%{exists('g:loaded_ale')?ALEGetStatusLine():''}
set statusline+=\ %{grepper#statusline()}%*
