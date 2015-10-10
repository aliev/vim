function! python#pymake#runner(bang, makeprg, args)
  " Keep old settings
  let l:_makeprg = &makeprg
  let l:_efm = &efm

  " Python errors are multi-lined. They often start with 'Traceback', so
  " we want to capture that (with +G) and show it in the quickfix window
  " because it explains the order of error messages.
  let s:efm  = '%+GTraceback%.%#,'

  " The error message itself starts with a line with 'File' in it. There
  " are a couple of variations, and we need to process a line beginning
  " with whitespace followed by File, the filename in "", a line number,
  " and optional further text. %E here indicates the start of a multi-line
  " error message. The %\C at the end means that a case-sensitive search is
  " required.
  let s:efm .= '%E  File "%f"\, line %l\,%m%\C,'
  let s:efm .= '%E  File "%f"\, line %l%\C,'

  " The possible continutation lines are idenitifed to Vim by %C. We deal
  " with these in order of most to least specific to ensure a proper
  " match. A pointer (^) identifies the column in which the error occurs
  " (but will not be entirely accurate due to indention of Python code).
  let s:efm .= '%C%p^,'

  " Any text, indented by more than two spaces contain useful information.
  " We want this to appear in the quickfix window, hence %+.
  let s:efm .= '%+C    %.%#,'
  let s:efm .= '%+C  %.%#,'

  " The last line (%Z) does not begin with any whitespace. We use a zero
  " width lookahead (\&) to check this. The line contains the error
  " message itself (%m)
  let s:efm .= '%Z%\S%\&%m,'

  " We can ignore any other lines (%-G)
  let s:efm .= '%-G%.%#'

  let &efm = s:efm

  let &makeprg = a:makeprg

  execute printf("Dispatch%s _ %s", a:bang ? "!" : "", a:args)

  let &makeprg = l:_makeprg
  let &efm = l:_efm
endfunction


function! python#pymake#fixqflist()
  let l:traceback = []
  let qflist = getqflist()
  for i in qflist
    if i.type == 'E'
      call add(l:traceback, i)
    endif
  endfor
  if !empty(l:traceback)
    call setqflist(l:traceback)
  endif
endfunction
