" Plugins

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

" Utils
Plugin 'bling/vim-airline'

" CtrlP
Plugin 'kien/ctrlp.vim'

" Display indentation lines
Plugin 'Yggdroot/indentLine'

" Patched nerdtree with my fonts
Plugin 'aliev/nerdtree'

" Toggle and display marks
Plugin 'kshenoy/vim-signature'

" Comment selected lines
Plugin 'tomtom/tcomment_vim'

" Syntax checker
Plugin 'scrooloose/syntastic'

" Git
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'

" Jedi for comfortable development with python
Plugin 'davidhalter/jedi-vim'

" Color scheme
Plugin 'jonathanfilip/vim-lucius'

" Python indent for vim
Plugin 'hynek/vim-python-pep8-indent'

" Indentation for html/javascript
Plugin 'lukaszb/vim-web-indent'

" Scripts collection for comfortable work
" with python and vim
Plugin 'aliev/vim-comfortable'
