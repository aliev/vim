" Auto fill import statement after type from A<space>
function! CompleteAndImport()
  if search('^\s*from\s\+[A-Za-z0-9._]\{1,50}\%#\s*$', 'bcn', line('.'))
    " Enter character and start completion.
    return " import \<C-x>\<C-o>"
  endif
  return ' '
endfunction

if !exists("g:python_auto_import")
  let g:python_auto_import=1
end

if g:python_auto_import
  inoremap <silent> <buffer> <expr> <Space> CompleteAndImport()
endif
