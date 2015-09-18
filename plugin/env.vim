if !exists('$PYTHONWARNINGS')
  let $PYTHONWARNINGS="ignore"
endif

if !exists('$PYTHONPATH')
  let $PYTHONPATH=$PWD
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

if exists('$VIRTUAL_ENV')
  " If we have activated python environment
  " set errorformat to pylint
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
endif
