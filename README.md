## vimrc

Base vimrc file

## autoload/plug.vim

[vim-plug](https://github.com/junegunn/vim-plug). It will be installed after the first run editor

## plugins.vim

Plugins list

## plugged/

Installed plugins. It will be available after the first running of vim

## plugin/settings.vim

Plugins settings

## plugin/env.vim

Auto activate environment variables:

``$DJANGO_SETTINGS_MODULE`` if projectname/settings.py file exists

``$VIRTUAL_ENV`` if virtualenv activated

``$PYTHONPATH`` and ``$PYTHONWARNINGS``

environment variables

## ftplugin/autoimport.vim

Auto insert import statement and run omnicomplete for Python

Can be disabled by ``let g:python_auto_import=0`` option

## ftplugin/folding.vim

Auto fold Python imports

## project/path/.vimrc or project/path/_vimrc

Bu default ``set exrc`` option is enabled and you can use project specific .vimrc

[My blog post about this vim configuration and installation](http://bit.ly/1NzFrBK)
