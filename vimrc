""""""""""""""""""""""""""""""""""""""""
" This is the minimum vim configuration
" file which can be used separately
" from other files
""""""""""""""""""""""""""""""""""""""""

scriptencoding utf-8

syntax on " enable syntax-highlighting

" GUI and Terminal VIM options {{{
if has("gui_running")
  " Disable all GUI elements and enable console based dialogs for simple queries
  set guioptions=gc
  " Default font for GUI Vim
  set guifont=Droid\ Sans\ Mono\ For\ Powerline\ Plus\ Nerd\ File\ Types\ Plus\ Pomicons:h13
else
  set t_Co=256
  " Automatic rename of tmux window
  if exists('$TMUX') && !exists('$NORENAME')
    au BufEnter * call system('tmux rename-window '.expand('%:t:S'))
    au VimLeave * call system('tmux set-window automatic-rename on')
  endif
endif
" }}}

" Mouse {{{
if has('mouse')
  set mouse=a " Enable mouse support
  set mousemodel=popup " Use the mouse for copy/paste with popup in gui vim
  set mousehide " Hide cursor while typing
  if exists("$TMUX")
    if !has('nvim')
      " Tmux knows the extended mouse mode
      set ttymouse=xterm2
    endif
  endif
endif
" }}}

" Multibyte {{{
if has('multi_byte')
  set listchars=trail:·,tab:»·,eol:¶,extends:→,precedes:←,nbsp:×
  " Vertical split chars
  set fillchars=stl:\ ,stlnc:\ ,vert:│
  if has('patch-7.4.338')
    let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
    set breakindent
    set breakindentopt=sbr
  endif
endif
" }}}

" Autocmd {{{
if has("autocmd")
  " Enable file type detection.
  filetype plugin indent on

  " Python indentation
  " About nosmartindent please look this link
  " http://stackoverflow.com/questions/2063175/vim-insert-mode-comments-go-to-start-of-line
  au FileType python setl nosmartindent

  " JavaScript indentation
  au FileType javascript setlocal expandtab shiftwidth=2 tabstop=2

  " Vim indentation
  au FileType vim setlocal expandtab shiftwidth=2 tabstop=2

  " Disable line numbers for QuickFix
  au FileType qf setlocal nonumber
endif
" }}}

" Remember cursor position {{{
augroup vimrc_remember_cursor_position
  au!
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
        \| exe "normal! g`\"" | endif
augroup END
" }}}

" Use ag over grep {{{
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let $FZF_DEFAULT_COMMAND='ag -l -g ""'
endif
" }}}

" Neovim options {{{
if has('nvim')
  set rtp+=~/.vim/
  " If Neovim support is enabled, then let set the
  " NVIM_TUI_ENABLE_CURSOR_SHAPE for the user.
  if $NVIM_TUI_ENABLE_CURSOR_SHAPE == ""
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
  endif
endif
" }}}

" Store undofile in to fixed location {{{
if exists("+undofile")
    " undofile - This allows you to use undos after exiting and restarting
    " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    " :help undo-persistence
    " This is only present in 7.3+
    set undofile

    " Store undo files in to fixed location
    set undodir=/var/tmp//,/tmp//,.
endif
" }}}

" Store swap files in to fixed location
set noswapfile
set directory=/var/tmp//,/tmp//,.

" Store backup files in to fixed location
set nobackup
set backupdir=/var/tmp//,/tmp//,.

" This will set your path variable to current directory
" (from which you launched vim) and to all directories
" under current directory recursively.
set path=.,,**

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
"set viminfo='10,\"100,:20,%,n~/.viminfo

" Disable timeout for Esc key
set ttimeout ttimeoutlen=0 notimeout
set ttyfast " Optimize for fast terminal connections
set lazyredraw " Don't redraw while executing macros (good performance config)

" Autocomplete options:
" longest: do not select the first candidate
" preview: removed includes display of documentation
set completeopt=menuone,longest

set confirm " Get a dialog when :q, :w, or :wq fails

let mapleader = "," " Map leader

let maplocalleader = "_" " Local leader

set hlsearch " Highlight search terms (very useful!)

set incsearch " Show search matches while typing

set display+=lastline " Display lastline instead of @

set laststatus=2 " Enable statusline

set magic " For regular expressions turn magic on

set ignorecase " Searches are Non Case-sensitive

set smartcase " Do smart case matching when searching

set showcmd " Show incomplete cmds down the bottom

set title " Show title

set acd " Vim will change the current working directory whenever you open a file

set autoread " Reload files changed outside automatically

" Use space instead of tab
set tabstop=4 shiftwidth=4 expandtab

set backspace=2 " Make backspace work like most other apps

set smarttab " Be smart when using tabs

set autoindent " Enable auto indent

set smartindent " Smart indent

" Enable word wrap
" Disable line break
set wrap tw=0

set noerrorbells visualbell t_vb= " No annoying sound on errors

set encoding=utf8 " Default encoding

set termencoding=utf-8 " Terminal encoding

set fileencodings=utf8,cp1251 " Supported file encodings

set number " Enable line numbers

set ruler " Always display cursor position

set hidden " A buffer becomes hidden when it is abandoned

set noautochdir " Change the current working directory whenever you open a file

set wildmenu " Turn on the Wild menu

set wildmode=list:longest,list:full " Wildmenu configuration

set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git " Ignore compiled files

set conceallevel=2 " Conceal level

set modelines=1 " Make Vim only use folding settings for current file

set noshowmode " Suppress mode change messages

set exrc " Allow load .vimrc or _vimrc from current directory

" I like to leave this option empty
" So, I can run any commands by using :make
" eg :make make, :make django-admin runserver
set makeprg=

" Add Python error format
set efm+=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

if filereadable(expand('~/.vim/plugins.vim'))
  " Include plugins list
  source ~/.vim/plugins.vim
endif

" vim:foldmethod=marker:foldlevel=0:tabstop=2:shiftwidth=2
