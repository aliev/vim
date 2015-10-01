if !exists('$DJANGO_SETTINGS_MODULE')
  finish
endif

let s:spc = g:airline_symbols.space

function! airline#extensions#django#init(ext)
  call a:ext.add_statusline_func('airline#extensions#django#apply')
endfunction

function! airline#extensions#django#apply(...)
  if &filetype =~ "python"
    let statusline = $DJANGO_SETTINGS_MODULE
    call airline#extensions#append_to_section('x',
          \ s:spc.g:airline_right_alt_sep.s:spc.statusline)
  endif
endfunction
