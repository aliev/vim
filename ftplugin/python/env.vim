if has('python')
py << EOF
import os
import os.path, sys
import vim

if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
    python_version = os.listdir(project_base_dir + '/lib')[0]

    site_packages = os.path.join(project_base_dir, 'lib', python_version, 'site-packages')
    # os.environ.setdefault('PYTHONPATH', site_packages)
    current_directory = os.getcwd()

    sys.path.insert(1, site_packages)
    sys.path.insert(1, current_directory)
EOF
endif

