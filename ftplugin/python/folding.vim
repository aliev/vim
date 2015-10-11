" I do not like code folding,
" but sometimes too long lists of imports
" at the beginning of the file is very annoying.

" Variables {{{1

let s:import = '^\(#\s*\)\?\(import\|from\)'

" }}}
" Helpers {{{1

function! s:pline(lnum)
  return getline(prevnonblank(a:lnum - 1))
endfunction

function! s:nline(lnum)
  return getline(nextnonblank(a:lnum + 1))
endfunction

" }}}
" Main folding {{{1

function! PythonFold(lnum)
  let line = getline(a:lnum)
  let level = indent(a:lnum) / &shiftwidth + 1

  if line =~ s:import
    return 2
  endif

  if indent(a:lnum) == 0
      return 0 
  endif 

  return "="

endfunction

" }}}

" {{{
setl foldtext=PythonFoldText()
setl foldmethod=expr
setl foldlevel=1
setl foldcolumn=1
setl foldexpr=PythonFold\(v:lnum\)
function! PythonFoldText() "{{{
  let line = getline(v:foldstart + 1)
  return line.' ['.(v:foldend - v:foldstart).'] '
endfunction "}}}

" vim:foldmethod=marker:foldlevel=0
