# Vimrc

Vimrc already has all the necessary vim settings that should be by default:

* Netrw configured
* Some ideas was taken from [vim-sensible](https://github.com/tpope/vim-sensible)
* Persistent undo / history is enabled, and directory was configured to tmp file system
* Tmux integration was added
* Mouse is enabled by default
* Hidden characters like tabs and trailing white spaces will shown by default
* Using ag instead of grep (if ag is installed)

...and more more features


# Installation

Just add these lines in ~/.vimrc

```
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

Plug 'aliev/vimrc'

" Initialize plugin system
call plug#end()
```
