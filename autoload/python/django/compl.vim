function! python#django#compl#managmentcommands(prefix, line, ...)
python << EOF
from django.core import management
from django.conf import settings

prefix = vim.eval('a:prefix')
commands = list(management.get_commands())

if prefix:
    commands = [command for command in commands if command.startswith(prefix)]

vim.command('return '+str(commands))
EOF
endfunction
