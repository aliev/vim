" pyenv.vim: An attempt to set
" Python environment variables 
" ============================
" 
" Features:
"
" We do not need Python warnings
" in QuickFix and etc
" $PYTHONWARNINGS="ignore"
"
" Set up $PYTHONPATH to current
" working directory
" $PYTHONPATH="current working directory"

if !has('python')
    echoerr "This script wont work without Python. Please compile with it."
    finish
endif

if !exists('$PYTHONWARNINGS')
  let $PYTHONWARNINGS="ignore"
endif

if !exists('$PYTHONPATH')
  let $PYTHONPATH=$PWD
endif

if !exists('$DJANGO_SETTINGS_MODULE')
  let s:django_project_name = split($PWD, '/')[-1]
  let s:django_settings_file = printf("%s/settings.py", s:django_project_name)
  let s:django_settings_module = printf("%s.settings", s:django_project_name)

  if filereadable(expand(s:django_settings_file))
    let $DJANGO_SETTINGS_MODULE=s:django_settings_module
  endif
endif

if has('python')
py << EOF
import os.path, sys
import vim

if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif
