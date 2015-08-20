" Plugins

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

" Lean & mean status/tabline for vim that's light as air
Plugin 'bling/vim-airline'

" Plugin to toggle, display and navigate marks
Plugin 'kshenoy/vim-signature'

" Icons support
" Adds font icons (glyphs ★♨☢) to programming languages,
" libraries, and web developer filetypes for:
" NERDTree, vim-airline, ctrlp, unite, lightline.vim, vimfiler, and flagship
Plugin 'ryanoasis/vim-devicons'

" An extensible & universal comment vim-plugin that also handles embedded
" filetypes
Plugin 'tomtom/tcomment_vim'

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

" Plugin which shows a git diff in the gutter (sign column)
" and stages/reverts hunks.
Plugin 'airblade/vim-gitgutter'

" a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" Jedi for comfortable development with python
" TODO: jedi 0.9.0 library has issue with imports
" you can fix this issue by move to stable jedi version (0.8.0):
" cd ~/.vim/bundle/jedi-vim/jedi/
" git checkout 7b402d7
Plugin 'davidhalter/jedi-vim'

" Color scheme
Plugin 'jonathanfilip/vim-lucius'

" A nicer Python indentation style for vim.
Plugin 'hynek/vim-python-pep8-indent'

" Javascript indenter (HTML indent is included)
Plugin 'lukaszb/vim-web-indent'

" Plugin to display the indention levels with thin vertical lines
Plugin 'Yggdroot/indentLine'

" My scripts collection for comfortable work
Plugin 'aliev/vim-comfortable'

" Improvement over standard matchparen plugin
Plugin 'vim-scripts/matchparenpp'

" A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree'

" A plugin of NERDTree showing git status
Plugin 'Xuyuanp/nerdtree-git-plugin'

" A command-line fuzzy finder written in Go
Plugin 'junegunn/fzf'

" Vim plugin to quantify your coding with automatic time tracking and metrics
" about your programming.
Plugin 'wakatime/vim-wakatime'

" True Sublime Text style multiple selections for Vim
Plugin 'terryma/vim-multiple-cursors'

" text using the same key combination.
Plugin 'terryma/vim-expand-region'

" Quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'

" Improved incremental searching for Vim
Plugin 'haya14busa/incsearch.vim'

" Lightning fast left-right movement in Vim
Plugin 'unblevable/quick-scope'

" Vim Emoji
Plugin 'junegunn/vim-emoji'
