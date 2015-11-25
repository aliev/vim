" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Plug to toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" A command-line fuzzy finder written in Go
Plug 'junegunn/fzf', {'do': 'yes \| ./install'}
Plug 'junegunn/fzf.vim'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Javascript indenter (HTML indent is included)
Plug 'lukaszb/vim-web-indent'

" Plug to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" Git Place {{{
" Plug which shows a git diff in the gutter (sign column)
" and stages/reverts hunks.
Plug 'airblade/vim-gitgutter'

" a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" A plugin of NERDTree showing git status
Plug 'Xuyuanp/nerdtree-git-plugin'
" }}}

" Python/Django Place {{{
Plug 'aliev/vim-python'

" htmldjango filetype omnicomplete - completes template tags/filters/variables
Plug 'mjbrownie/vim-htmldjango_omnicomplete'

" A nicer Python indentation style for vim.
Plug 'hynek/vim-python-pep8-indent'

" Jedi for comfortable development with python
" TODO: jedi 0.9.0 library has issue with imports
" I'll fix this issue by using stable jedi version (0.8.1):
Plug 'davidhalter/jedi-vim', {'do': 'cd jedi/ && git checkout 7b402d7'}
" }}}

" For correct install color schemes pls read these notes
" https://github.com/chriskempson/base16-vim
" https://github.com/chriskempson/base16-shell
" https://github.com/chriskempson/base16-iterm2
Plug 'chriskempson/base16-vim'

" Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'

" Forget Vim tabs – now you can have buffer tabs
Plug 'ap/vim-buftabline'

" Make terminal vim and tmux work better together.
Plug 'tmux-plugins/vim-tmux-focus-events'

if filereadable(expand('~/.vimrc.local'))
  " Local vimrc file
  " can be included local plugins list too
  source ~/.vimrc.local
endif
set background=light

call plug#end()
" vim:foldmethod=marker:foldlevel=0
