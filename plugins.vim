" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Lean & mean status/tabline for vim that's light as air
Plug 'bling/vim-airline'

" Plug to toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

" Icons support
" Adds font icons (glyphs ★♨☢) to programming languages,
" libraries, and web developer filetypes for:
" NERDTree, vim-airline, ctrlp, unite, lightline.vim, vimfiler, and flagship
Plug 'ryanoasis/vim-devicons'

" An extensible & universal comment vim-plugin that also handles embedded
" filetypes
Plug 'tomtom/tcomment_vim'

" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

" Plug which shows a git diff in the gutter (sign column)
" and stages/reverts hunks.
Plug 'airblade/vim-gitgutter'

" a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Jedi for comfortable development with python
" TODO: jedi 0.9.0 library has issue with imports
" I'll fix this issue by using stable jedi version (0.8.1):
Plug 'davidhalter/jedi-vim', {'do': 'cd jedi/ && git checkout 7b402d7'}

" A nicer Python indentation style for vim.
Plug 'hynek/vim-python-pep8-indent'

" Javascript indenter (HTML indent is included)
Plug 'lukaszb/vim-web-indent'

" My scripts collection for comfortable work
Plug 'aliev/vim-comfortable'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" A plugin of NERDTree showing git status
Plug 'Xuyuanp/nerdtree-git-plugin'

" A command-line fuzzy finder written in Go
Plug 'junegunn/fzf', {'do': 'yes \| ./install'}

" Plug to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Improvement over standard matchparen plugin
Plug 'vim-scripts/matchparenpp'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" Improved incremental searching for Vim
Plug 'haya14busa/incsearch.vim'

" Toggle the cursor shape in the terminal for Vim 
Plug 'jszakmeister/vim-togglecursor'

" Simple tmux statusline generator with support for powerline symbols and
" statusline / airline / lightline integration
" and my tmux conf https://gist.github.com/aliev/e900f25134a90c648442
Plug 'edkolev/tmuxline.vim'

" For correct install color schemes pls read these notes
" https://github.com/chriskempson/base16-vim
" https://github.com/chriskempson/base16-shell
" https://github.com/chriskempson/base16-iterm2
Plug 'chriskempson/base16-vim'

" htmldjango filetype omnicomplete - completes template tags/filters/variables
Plug 'mjbrownie/vim-htmldjango_omnicomplete'

Plug 'rizzatti/dash.vim'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-dispatch'

call plug#end()
