 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'mattn/zencoding-vim'
 Bundle 'tpope/vim-endwise'
 Bundle 'scrooloose/nerdtree'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'tpope/vim-rails.git'
 Bundle 'majutsushi/tagbar'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'vim-scripts/HTML-AutoCloseTag'
 Bundle 'tpope/vim-rvm'
 Bundle 'beyondwords/vim-twig'

 " snipmate
 Bundle "MarcWeber/vim-addon-mw-utils"
 Bundle "tomtom/tlib_vim"
 Bundle "honza/snipmate-snippets"
 Bundle "garbas/vim-snipmate"

 " vim-scripts repos
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 " ...

 filetype plugin indent on     " required!
 source ~/.vim/config
