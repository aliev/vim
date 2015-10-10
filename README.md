# vim-python-tools
Vim Python tools, comfortable work with django, python and etc

# Installation

Django command depends on the [vim-dispatch](https://github.com/tpope/vim-dispatch) module, therefore it is necessary to install it. You can install [vim-htmldjango_omnicomplete](https://github.com/mjbrownie/vim-htmldjango_omnicomplete) module too, to enable omnicompletion in your django templates. For installation modules and packages in vim, I use a lightweight package manager - [vim-plug](https://github.com/junegunn/vim-plug/wiki). In your vimrc:

```
Plug 'mjbrownie/vim-htmldjango_omnicomplete'
Plug 'tpope/vim-dispatch'

if has('nvim')
  " Adds neovim support to vim-dispatch
  Plug 'radenling/vim-dispatch-neovim', {'branch': 'foreground-terminal'}
endif

Plug 'aliev/vim-python-tools'
```

vim-dispatch will allow to you run the external commands asynchronously, without exiting from Vim. As we know running external commands blocks vim. As the backend for vim-dispatch, I recommend using tmux. Ff you use neovim, you do not worry about it.

### Auto set up environment variables

``$PYTHONWARNINGS``

``$PYTHONPATH``

### Django Support

Module can automatically detect your current Django project and find DJANGO_SETTINGS_MODULE automatically when you run an editor at the root of your project. Supports [vim-airline](https://github.com/bling/vim-airline), it shows current ``$DJANGO_SETTINGS_MODULE`` near virtualenv.

By this module you can run any Django commands from your vim. Eg:

``:Django runserver``

or

``:Django <tab>``
``:Django! <tab>``

to see list of Django commands.

Run tests:

``:Django test``

Asynchronously

``Django! test``

If you're using nosetests, you can run tests for current opened file

``Django test %``

if during the test there will be errors, will automatically open the quickfix

### How to set up ``$DJANGO_SETTINGS_MODULE`` variable?

``$DJANGO_SETTING_MODULE`` environment variable is set automatically if you have a standard Django> 1.4 project. This environment variable is necessary for the ``:Django`` command and [vim-htmldjango_omnicomplete](https://github.com/mjbrownie/vim-htmldjango_omnicomplete) module. If you do not have a specific project, you can set this variable manually, by using export:

``export DJANGO_SETTINGS_MODULE='projectname.settings_path.settings' && vim``

or just create ``.vimrc`` (or ``.nvimrc`` for neovim) file in your project root and run vim (be sure to set ``set exrc`` option in your base ``.vimrc`` file) with this option:

``let $DJANGO_SETTINGS_MODULE='projectname.settings_path.settings``

and run your vim from project root.

### Fold imports
### Auto insert import statement
### Auto detect virtualenv

``$VIRTUAL_ENV``
