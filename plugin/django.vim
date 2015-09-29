if !has('python')
    echoerr "This script wont work without Python. Please compile with it."
    finish
endif

if !exists('$DJANGO_SETTINGS_MODULE')
  let s:django_project_name = split($PWD, '/')[-1]
  let s:django_settings_file = printf("%s/settings.py", s:django_project_name)
  let s:django_settings_module = printf("%s.settings", s:django_project_name)

  if filereadable(expand(s:django_settings_file))
    let $DJANGO_SETTINGS_MODULE=s:django_settings_module
  endif
endif

if exists('$DJANGO_SETTINGS_MODULE')
  let &makeprg = "django-admin"
endif

command! -bang -nargs=* -complete=customlist,django#completions#managmentcommands Django
      \ Dispatch<bang> _ <args>
