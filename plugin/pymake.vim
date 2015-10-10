command! -bang -nargs=* -complete=customlist,python#django#compl#managmentcommands Django
      \ call python#pymake#runner(<bang>0, 'django-admin', <q-args>)

augroup fix-qflist
  autocmd!
  au QuickFixCmdPost * call python#pymake#fixqflist()
augroup END
