function! django#commands#manage(bang, command)
  let command = a:command
  let background = a:bang

  let &makeprg = "django-admin"

  if background
    execute "Make! " . a:command
  else
    execute "Make " . a:command
  endif
endfun
