" Plugins

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

" Utils
Plugin 'bling/vim-airline'

" Toggle and display marks
Plugin 'kshenoy/vim-signature'

Plugin 'ryanoasis/vim-devicons'

" Comment selected lines
Plugin 'tomtom/tcomment_vim'

" Syntax checker
Plugin 'scrooloose/syntastic'

" Show a git diff in a sign column
Plugin 'airblade/vim-gitgutter'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Jedi for comfortable development with python
Plugin 'davidhalter/jedi-vim'

" Color schemes
Plugin 'flazz/vim-colorschemes'

" Python indent
Plugin 'hynek/vim-python-pep8-indent'

" Html/JavaScript indent
Plugin 'lukaszb/vim-web-indent'

" Display indentation lines
Plugin 'Yggdroot/indentLine'

" My scripts collection for comfortable work
Plugin 'aliev/vim-comfortable'

" Match parent (instead of default)
Plugin 'vim-scripts/matchparenpp'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Git support for NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'mattn/emmet-vim'

Plugin 'SirVer/ultisnips'

Plugin 'honza/vim-snippets'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'junegunn/goyo.vim'

Plugin 'junegunn/fzf'

Plugin 'terryma/vim-expand-region'

Plugin 'tpope/vim-surround'

Plugin 'haya14busa/incsearch.vim'

Plugin 'wakatime/vim-wakatime'
