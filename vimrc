scriptencoding utf-8

if has('nvim')
  " Load plugins
  set rtp+=~/.vim
endif

" Plugins {{{
" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Make terminal vim and tmux work better together.
Plug 'tmux-plugins/vim-tmux-focus-events'
" Readline style insertion
Plug 'tpope/vim-rsi'
Plug '~/vimrc'

" Load plugins from ~/.vimrc.local
if filereadable(expand('~/.vimrc.local'))
  " Plugins list and settings should be loaded
  " only once. Load local_plugins block
  let g:local_plugins = 1
  let g:local_settings = 0
  source ~/.vimrc.local
endif

call plug#end()
" }}}

let mapleader=','
let maplocalleader='\\'

" Load plugins options from ~/.vimrc.local
if filereadable(expand('~/.vimrc.local'))
  " Plugins list and settings should be loaded
  " only once. Load local_settings block
  let g:local_plugins = 0
  let g:local_settings = 1
  source ~/.vimrc.local
endif

" vim:foldmethod=marker:foldlevel=0:tabstop=2:shiftwidth=2
