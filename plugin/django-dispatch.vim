fun! Django(bang, command)
  let command = a:command
  let background = a:bang

  let &makeprg = "django-admin"

  if empty(command)
    execute "Make! shell"
  endif

  if background
    execute "Make! " . a:command
  else
    execute "Make " . a:command
  endif
endfun

if exists('$DJANGO_SETTINGS_MODULE')
  command! -bang -nargs=* Django call Django(<bang>0, <q-args>)
endif
