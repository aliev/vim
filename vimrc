 set nocompatible               " be iMproved
 filetype off                   " required!
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()
 Bundle 'gmarik/vundle'

 " Bundles
 "
 Bundle 'altercation/vim-colors-solarized'
 
 " Ruby
 Bundle 'tpope/vim-rvm'
 Bundle 'tpope/vim-endwise'
 Bundle 'tpope/vim-rails.git'
 Bundle 'nelstrom/vim-textobj-rubyblock'
 
 " All Languages
 Bundle 'b4winckler/vim-objc'

 " HTML/CSS
 Bundle 'vim-scripts/HTML-AutoCloseTag'
 Bundle 'mattn/zencoding-vim'
 Bundle 'gregsexton/MatchTag'

 " Python
 Bundle 'lambdalisue/vim-django-support'

 " JavaScript
 Bundle 'pangloss/vim-javascript'
 Bundle 'kchmck/vim-coffee-script'

 " Tools
 Bundle 'sjl/gundo.vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'majutsushi/tagbar'
 Bundle 'Shougo/neocomplcache'
 Bundle 'Shougo/neocomplcache-snippets-complete'
 Bundle 'scrooloose/syntastic'
 Bundle 'vim-scripts/matchit.zip'
 Bundle 'nathanaelkane/vim-indent-guides'
 Bundle "MarcWeber/vim-addon-mw-utils"
 Bundle "tomtom/tlib_vim"
 Bundle 'tpope/vim-surround'
 Bundle 'tomtom/tcomment_vim'
 Bundle 'mattn/gist-vim'
 Bundle "honza/snipmate-snippets"
 Bundle 'garbas/vim-snipmate'
 Bundle 'git://github.com/kana/vim-textobj-user.git'
 Bundle 'git://git.wincent.com/command-t.git'
 Bundle 'tpope/vim-fugitive' " For Git and powerline
 

 filetype plugin indent on     " required!

 source ~/.vim/config.vim
