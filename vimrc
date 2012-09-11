 set nocompatible               " be iMproved
 filetype off                   " required!
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()
 Bundle 'gmarik/vundle'

 " Bundles
 "
 Bundle 'vim-scripts/HTML-AutoCloseTag'
 Bundle 'tpope/vim-rvm'
 Bundle 'tpope/vim-endwise'
 Bundle 'tpope/vim-rails.git'
 Bundle 'mattn/zencoding-vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'majutsushi/tagbar'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'beyondwords/vim-twig'
 Bundle 'gregsexton/MatchTag'
 Bundle 'Shougo/neocomplcache'
 Bundle 'Shougo/neocomplcache-snippets-complete'
 Bundle 'scrooloose/syntastic'
 Bundle 'vim-scripts/matchit.zip'
 Bundle 'pangloss/vim-javascript'
 Bundle 'kchmck/vim-coffee-script'
 Bundle 'nelstrom/vim-textobj-rubyblock'
 Bundle 'nathanaelkane/vim-indent-guides'
 Bundle "MarcWeber/vim-addon-mw-utils"
 Bundle "tomtom/tlib_vim"
 Bundle "honza/snipmate-snippets"
 Bundle 'garbas/vim-snipmate'
 Bundle 'git://github.com/kana/vim-textobj-user.git'
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 Bundle 'git://git.wincent.com/command-t.git'
 Bundle 'vim-scripts/VimExplorer'
 Bundle 'Shougo/vimproc'
 Bundle 'Shougo/vimshell'
 filetype plugin indent on     " required!

 source ~/.vim/config.vim
