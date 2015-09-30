function! django#dispatch#make(bang, args)
  let oldmakeprg = &makeprg
  let oldefm = &efm

  let &makeprg = "django-admin"
  let &efm="%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m"

  execute printf("Dispatch%s _ %s", a:bang ? "!" : "", a:args)

  let &makeprg = oldmakeprg
  let &efm = oldefm
endfunction
