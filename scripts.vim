" Add the virtualenv's site-packages to vim path
if has("python")
py << EOF
import os.path
import sys
import vim

if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))

cur_dir = os.path.join(os.getcwd().split('/').pop())
if os.path.exists(os.path.join(cur_dir, 'settings.py')):
    os.environ['DJANGO_SETTINGS_MODULE'] = '%s.settings' % cur_dir

#add the pwd to sys path as it is not appearing in
sys.path.insert(0,os.getcwd())
EOF

    " Load up virtualenv's vimrc if it exists
    if filereadable($VIRTUAL_ENV . '/.vimrc')
        source $VIRTUAL_ENV/.vimrc
    endif
endif

" Auto fill import statement after type from A<space>
function! CompleteAndImport()
  if search('\<from\s\+[A-Za-z0-9._]\+\s*\%#\s*$', 'bcn', line('.'))
    " Enter character and start completion.
    return " import \<C-x>\<C-o>"
  endif
  return ' '
endfunction

function! Complete()
    return ".\<C-x>\<C-o>\<C-n>"
endfunction

if has("autocmd")
    au FileType python inoremap <buffer> <expr> <Space> CompleteAndImport()

    " Complete after pressing dot button
    " TODO: Need refactoring
    au FileType javascript inoremap <buffer> . <C-R>=Complete()<CR>
endif
